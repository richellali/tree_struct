

#include <assert.h>
#include <stdlib.h>
#include "bst.h"
#include "cs136-trace.h"
#include "pow2.h"



struct bst *bst_create_empty(void) {
  struct bst *tree = malloc(sizeof(struct bst));
  tree->root = NULL;
  return tree;
}

// bstnode *new_leaf(i) creates a new leaf in the memory
// effect: allocates memory(caller must free it);
// efficiency: O(1)

static struct bstnode *new_leaf(int i) {
  struct bstnode *leaf = malloc(sizeof(struct bstnode));
  leaf->item = i;
  leaf->left = NULL;
  leaf->right = NULL;
  leaf->count = 1;
  return leaf;
}


bool bst_contains(int i, const struct bst *tree) {
  assert(tree);
  struct bstnode *node = tree->root;
  while (node) {
    if (node->item == i) {
      return true;
    }
    if (i < node->item) {
      node = node->left;
    } else {
      node = node->right;
    }
  }
  return false;
}
// find_depth(item, tree) find the depth of the item in the tree

int find_depth(int item, struct bst *tree) {
  assert(tree);
  int depth = 1;
  struct bstnode *node = tree->root;
  while (node) {
    if (node->item == item) {
      break;
    }
    if (item < node->item) {
      depth++;
      node = node->left;
    } else {
      depth++;
      node = node->right;
    }
  }
  return depth;
}

// this is the iterative version of bst_insert
// you could replace this with the recursive version if you prefer

void bst_insert(int i, struct bst *tree) {
  assert(tree);
  struct bstnode *node = tree->root;
  struct bstnode *parent = NULL;

  if (bst_contains(i, tree) == true) return;

  while (node) {
    parent = node;
    if (i < node->item) {
      node->count++;
      node = node->left;
    } else {
      node->count++;
      node = node->right;
    }
  }
  if (parent == NULL) {  // tree was empty
    tree->root = new_leaf(i);
  } else if (i < parent->item) {
    parent->left = new_leaf(i);
  } else {
    parent->right = new_leaf(i);
  }
}


static struct bstnode *remove_bstnode(int i, struct bstnode *node) {
  // key did not exist:
  if (node == NULL) return NULL;

  // search for the node that contains the key
  if (i < node->item) {
    node->count--;
    node->left = remove_bstnode(i, node->left);
  } else if (i > node->item) {
    node->count--;
    node->right = remove_bstnode(i, node->right);
  } else if (node->left == NULL) {
    struct bstnode *new_root = node->right;
    free(node);
    return new_root;
  } else if (node->right == NULL) {
    struct bstnode *new_root = node->left;
    free(node);
    return new_root;
  } else {
    // find next largest key and its parent
    struct bstnode *next = node->right;
    struct bstnode *parent_of_next = NULL;
    while (next->left) {
      next->count--;
      parent_of_next = next;
      next = next->left;
    }
    // free old value & replace key/value of this node
    node->item = next->item;
    node->count--;
    // remove next largest node
    if (parent_of_next) {
      parent_of_next->left = next->right;
    } else {
      node->right = next->right;
    }
    free(next);
  }
  return node;
}


void bst_remove(int i, struct bst *tree) {
  assert(tree);
  tree->root = remove_bstnode(i, tree->root);
}


static int select_node(int k, struct bstnode *node) {
  assert(node && 0 <= k && k < node->count);
  int left_count = 0;
  if (node->left) {
    left_count = node->left->count;
  }
  if (k < left_count) {
    return select_node(k, node->left);
  }
  if (k == left_count) {
    return node->item;
  }
  return select_node(k - left_count - 1, node->right);
}


int bst_select(int k, struct bst *tree) {
  assert(tree);
  return select_node(k, tree->root);
}


static void free_bstnode(struct bstnode *node) {
  if (node) {
    free_bstnode(node->left);
    free_bstnode(node->right);
    free(node);
  }
}


void bst_destroy(struct bst *tree) {
  assert(tree);
  free_bstnode(tree->root);
  free(tree);
}

///////////////////////////////////////
// The following functions are
// for you to implement:
// (only critical documentation shown)
///////////////////////////////////////

// nodes_to sorted_array(a, node, index) change the tree to a 
// sorted array.
// effect: modify a[].

static void nodes_to_sorted_array(int *a, struct bstnode *node,
                                  int *index) {
  assert(node);
  if (node->left != NULL) {
    nodes_to_sorted_array(a, node->left, index);
  }
  //trace_int(node->item);
  a[*index] = node->item;
  trace_int(node->item);
  (*index)++;
  if (node->right != NULL) {
    nodes_to_sorted_array(a, node->right, index);
  }
}

// effects: modifies *len to store the length of the array
//          allocates memory (caller must free)
// time: O(n)
int *bst_to_sorted_array(const struct bst *tree, int *len) {
  assert(tree);

  if (tree->root == NULL) {
    *len = 0;
    return NULL;
  } else {
    *len = tree->root->count;
    int *a = malloc(*len * sizeof(int));
    int index = 0;
    nodes_to_sorted_array(a, tree->root, &index);
    return a;
  }
}

// node_create_balanced(a, left, middle) create a new leaf in the
// memory from a sorted array/
// effect: modifies memory

static struct bstnode *node_create_balanced(int *a, int left,
                                            int right, int middle) {
  assert(a);

  if (left > right) return NULL;
  struct bstnode *node = new_leaf(a[middle]);
  int left_mid;
  if ((left + middle) % 2 == 0) {
    left_mid = (left + middle - 1) / 2 + 1;
  } else {
    left_mid = (left + middle - 1) / 2;
  }
  int right_mid;
  if ((right + middle) % 2 == 0) {
    right_mid = (right + middle + 1) / 2 + 1;
  } else {
    right_mid = (right + middle + 1) / 2;
  }

  node->left = node_create_balanced(a, left, middle - 1,
                                    left_mid);
  node->right = node_create_balanced(a, middle + 1, right,
                                     right_mid);

  if (node->left && node->right) {
    node->count = node->left->count + node->right->count + 1;
  } else if (node->left) {
    node->count = node->left->count + 1;
  } else if (node->right) {
    node->count = node->right->count + 1;
  } else {
    node->count = 1;
  }
  return node;
}

// requires: a is an ascending sorted array without duplicates [not asserted]
//           len >= 1
// time: O(n)
struct bst *bst_create_balanced(int a[], int len) {
  assert(a);

  struct bst *tree = bst_create_empty();
  int middle;
  if (len % 2 == 0) {
    middle = (0 + len - 1) / 2 + 1;
  } else {
    middle = (0 + len - 1) / 2;
  }
  tree->root = node_create_balanced(a, 0, len - 1, middle);
  return tree;
}



// time: O(n) [O(log n) when no re-balance occurs]
void bst_insert_rebalance(int i, struct bst *tree) {
  assert(tree);
  struct bstnode *old = tree->root;
  if (!bst_contains(i, tree)) {
    bst_insert(i, tree);
    int depth = find_depth(i, tree);
    trace_int(depth);
    int min_hei = log2floor(tree->root->count);
    trace_int(min_hei);
    if (depth > 2 * min_hei) {
      int len = 0;
      int *a = bst_to_sorted_array(tree, &len);
      tree->root = NULL;
      struct bst *t = bst_create_balanced(a, len);
      tree->root = t->root;
      free(t);
      trace_int(tree->root->item);
      free_bstnode(old);
      free(a);
    }      
  }
}

// ttl_node(depth) find 2^0 + 2^1 + ... + 2^(n - 1).

static int ttl_node(int depth) {
  int sum = 0;
  for (int i = 0; i < depth; i++) {
    sum += pow2(i);
  }
  return sum;
}

// node_compact(a, start, end) creates a new leaf for bst
// effect:allocates memory

static struct bstnode *node_compact(int *a, int start, int end) {
  assert(a);
  if (start >= end) return NULL;

  int len = end - start;
  
  if (len == 1) {
    struct bstnode *node = new_leaf(a[start]);
    return node;
  }
  int min_hei = log2floor(len);
  int max_hei = log2ceil(len);
  int extra = len - ttl_node(min_hei);
  int last_left = pow2(min_hei - 1);
  int middle;
  if (extra >= last_left) {
    middle = start + ttl_node(max_hei - 1);
  } else {
    middle = start + ttl_node(max_hei - 1) - (last_left - extra);
  }
  trace_int(middle);
  struct bstnode *node = new_leaf(a[middle]);
  node->left = node_compact(a, start, middle);
  node->right = node_compact(a, middle + 1, end);

  if (node->left && node->right) {
    node->count = node->left->count + node->right->count + 1;
  } else if (node->left) {
    node->count = node->left->count + 1;
  } else if (node->right) {
    node->count = node->right->count + 1;
  } else {
    node->count = 1;
  }
  return node;
}

// time: O(n)

void bst_compact(struct bst *tree) {
  assert(tree);

  int len = 0;
  int *a = bst_to_sorted_array(tree, &len); 
  struct bstnode *old = tree->root;
  struct bst *t = bst_create_empty();
  t->root = node_compact(a, 0, len);
  tree->root = t->root;
  free(t);
  trace_int(tree->root->item);
  free_bstnode(old);
  free(a);
}

