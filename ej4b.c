int swapping(int mem,int n){
   int* d=0;
   for (d=0 ; d<n/2 ; d=d+1){
        int t=0;
        t = mem[d];
        mem[d] = mem[n-d-1];
        mem[n-d-1] = t;
    }
    return mem;
}
               