#include <stdio.h>


namespace Operations {

    /* Sums all numbers in range v1 - imperatively */
    int sumall(int of) {
        /* mut */ int sumall = 0;

        for (/* mut */ int index = 1; index <= of; /* mut */ ++index) {
            /* mut */ sumall += index;
        }

        return sumall;
    }


    /* Sums all numbers in range v2 - recursively */
    int sumall_v2(int of) {
        if (of > 0)
            return of + sumall(of - 1);
        else
            return 0;
    }


    /* Counts factorial of given number v1 - imperatively */
    int factorial(int of) {
        /* mut */ int factorial = 1;

        for (/* mut */ int index = 1; index <= of; /* mut */ ++index) {
            /* mut */ factorial *= index;
        }

        return factorial;
    }


    /* Counts factorial of given number v2 - recursively */
    int factorial_v2(int of) {
        if (of > 1)
            return of * factorial(of - 1);
        else
            return 1;
    }


}


int main() {
    using namespace Operations;

    /* mut */ int of = 10;

    /* 1st call */ printf("Imperatively: %d! = %d, sumall = %d\n", of, factorial(of), sumall(of));
    /* 2nd call */ printf("Recursively: %d! = %d, sumall = %d\n", of, factorial_v2(of), sumall_v2(of));
    /* Nth calls */ printf("From 0: 0! = %d, sumall: %d\n", factorial(0), sumall(0));

    return 0;
}
