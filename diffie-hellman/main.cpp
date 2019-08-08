#include "Person.h"
#include <stdlib.h>  /* srand, rand */
#include <time.h>  /* time */
#include <stdio.h> 

/**
 * 1) Alice comes up with a prime number p and a number g which is coprime to p-1 and tells Bob what they are.
 * 2) Alice then pick a secret number (a), but she doesn't tell anyone, and computes g^a mod p and sends that result back to Bob. (Call that A since it came from a).
 * 3) Bob does the same thing, calls his secret number b and then computed number B. So Bob computes g^b mod p and sends Alice the result (called "B")
 * 4) Now, Alices take the number Bob sent her and does the exact same operation with it. So that's B^a mod p.
 * 5) Bob does the same operation with the result Alice sent him, so: A^b mod p.
 * 
 * The algorithm works becase of the following property:
 *     (g^a mod p)^b mod p = g^(ab) mod p
 *     (g^b mod p)^a mod p = g^(ba) mod p
 */

int main() {
    srand(time(NULL));
    Person alice;
    Person bob;
    printf("\n");
    alice.setPandG(23, 9);
    bob.setPandG(23, 9);
    printf("Alice's public p and g keys are %lld and %lld\n", alice.getP(), alice.getG());
    printf("Bobs's public p and g keys are %lld and %lld\n", bob.getP(), bob.getG());

    alice.setRandomPrivateKey();
    bob.setRandomPrivateKey();
    printf("Alice's secret key is: %lld\n", alice.getPrivateKey());
    printf("Bobs's secret key is: %lld\n", bob.getPrivateKey());

    printf("Alice's partially computed key is: %lld\n", alice.getPartialKey());
    printf("Bobs's partially computed key is: %lld\n", bob.getPartialKey());

    bob.setFinalKey(alice.getPartialKey());
    alice.setFinalKey(bob.getPartialKey());
    printf("Alice's shared final secret key is: %lld\n", alice.getFinalKey());
    printf("Bobs's shared final secret key is: %lld\n", bob.getFinalKey());
    printf("\n");

    return 0;
}