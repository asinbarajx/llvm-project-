// Test case - Common subexpression elimination

int compute(int b, int c){
    int a = b + c;
    int d = b + c; // same expression -> reuse a

    return a * d;
}
