

extern const int maxpow2; // 30

// pow2(n) returns 2^n
// requires: 0 <= n <= maxpow2
// time: O(1)
int pow2(int n);

// log2floor(n) returns the floor of log_2(n)
// requires: 0 < n <= 2^maxpow2
// time: O(1)
int log2floor(int n);

// log2ceil(n) returns the ceiling of log_2(n)
// requires: 0 < n <= 2^maxpow2
// time: O(1)
int log2ceil(int n);
