
struct bst;

// trace_bst(tree) draws a really pretty tree 
// note: displays to stderr (trace output)
//       so it does not affect any I/O tests
// time: O(n)
void trace_bst(const struct bst *tree);

// trace_bst_plain(tree) is an almost identical, but slightly lamer
//   version of trace_bst, provided in case the other one doesn't work
void trace_bst_plain(const struct bst *tree);

// trace_bst_count(tree) is the same as trace_bst, but
//   also shows the counts
void trace_bst_count(const struct bst *tree);
