#include <stdio.h>


/* Usually kinda silly but common approach */
struct FactorialAndSum {
    int factorial;
    int sumall;
};


/* Counts factorial and sum of given number */
FactorialAndSum factorial_and_sumall(int of) {
    /* mut */ int factorial = 1;
    /* mut */ int sumall = 0;

    for (/* mut */ int index = 1; index <= of; /* mut */ ++index) {
        /* mut */ factorial *= index;
        /* mut */ sumall += index;
    }

    /* mut */ FactorialAndSum values = {
        .factorial = factorial,
        .sumall = sumall,
    };

    return values;
}


int main() {
    /* mut */ int of = 10;
    /* mut */ FactorialAndSum values; /* unknown/ invalid state */

    /* mut, single call */ values = factorial_and_sumall(of); /* initialization of structure object */
    /* reading values */ printf("C++: %d! = %d, sumall = %d\n", of, values.factorial, values.sumall);

    /* when we wish only to count factorial or only sumall of any other value - we're basically screwed here, cause we have to rewrite the implementation or call whole thing again */

    return 0;
}
