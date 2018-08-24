#include <stdio.h>


namespace Operations {

    /* Sums all numbers in range */
    int sumall(int of) {
        /* mut */ int sumall = 0;

        for (/* mut */ int index = 1; index <= of; /* mut */ ++index) {
            /* mut */ sumall += index;
        }

        return sumall;
    }


    /* Counts factorial of given number */
    int factorial(int of) {
        /* mut */ int factorial = 1;

        for (/* mut */ int index = 1; index <= of; /* mut */ ++index) {
            /* mut */ factorial *= index;
        }

        return factorial;
    }

}


int main() {
    using namespace Operations;

    /* mut */ int of = 10;

    /* 1st call */ printf("C++: %d! = %d, sumall = %d\n", of, factorial(of), sumall(of));
    /* Nth calls */ printf("C++: 0! = %d, sumall: %d\n", factorial(0), sumall(0));

    return 0;
}
