// TODO: you must complete this interface file
//       for the bst data structure

#include <stdbool.h>

///////////////////////////////////////
// DO NOT MODIFY THESE STRUCTURES
///////////////////////////////////////
struct bstnode {
  int item;
  struct bstnode *left;
  struct bstnode *right;
  int count;               // <-- new!
};

struct bst {
  struct bstnode *root;
};
///////////////////////////////////////

// bst_create_empty(void) creates a new bst tree in the memory.
// effect: allocate memory(clients must call bst_destroy)
// efficienct: O(1)

struct bst *bst_create_empty(void);

// bst_contains(i, tree) return true if the tree contains the int i
// false otherswise.
// efficiency: O(h) h is the height of the tree

bool bst_contains(int i, const struct bst *tree);

// bst_insert(i, tree) inserts a new leaf into the tree, if the
// node exists, the tree remains the same.
// effect: may modifiy tree
// efficiency: O(h), h is the height of the tree.

void bst_insert(int i, struct bst *tree);

// bst_remove(i, tree) removes the item from the tree, if the item
// doesn't exist, the tree does not change.
// effect: may modify tree
// efficiency: O(h), h is the height of the tree 

void bst_remove(int i, struct bst *tree);

// bst_select(k, tree) returns the item with the index k.
// requires: index k exists
// efficiency: O(h), h is the height of the tree.

int bst_select(int k, struct bst *tree);

// bst_destroy(tree) free the tree from memory.
// effect: tree is no longer valid.
// efficiency: O(n), n is the max count of the tree.

void bst_destroy(struct bst *tree);

// bst_to_sorted_array(tree, len) creates a sorted arrat from bst
// in memory.
// effects: modifies *len to store the length of the array
//          allocates memory (caller must free)
// time: O(n)

int *bst_to_sorted_array(const struct bst *tree, int *len);

// bst_create_balanced（a, len）create a balanced bst from a sorted
// array.
// effect: modifies memory.
// requires: a is an ascending sorted array without duplicates [not asserted]
//           len >= 1
// time: O(n)

struct bst *bst_create_balanced(int a[], int len);

// bst_insert_rebalance(i, tree) inserts an int into the tree and 
// coverts a bst into a balanced bst if the tree needs to be 
// balanced.
// effect: may modify tree
// time: O(n) [O(log n) when no re-balance occurs]

void bst_insert_rebalance(int i, struct bst *tree);

// bst_compact(tree) coverts the tree into a complete tree if the
// tree is not completed.
// effect: may modify tree
// time: O(n)

void bst_compact(struct bst *tree);

