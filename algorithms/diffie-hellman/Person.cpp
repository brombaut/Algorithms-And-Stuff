#include "Person.h"
#include <math.h> 
#include <stdlib.h>  /* srand, rand */
#include <time.h>  /* time */
 
// Date constructor
Person::Person() { }

void Person::setPandG(llint pIn, llint gIn) {
    p = pIn;
    g = gIn;
}

void Person::setRandomPrivateKey() {
    s = rand() % 15 + 1;
}

void Person::setFinalKey(llint partnersPartialKey) {
    generatedFinalKey = powerMod(partnersPartialKey, s, p);
}

// Power function to return value of a ^ b mod P 
llint Person::powerMod(llint a, llint b, llint P) {
    if (b == 1) {
        return a;
    } else {
        return (((long long int)pow(a, b)) % P);
    } 
}

llint Person::getPartialKey() {
    return powerMod(g, s, p);
}

llint Person::getP() {
    return p;
}

llint Person::getG() {
    return g;
}

llint Person::getPrivateKey() {
    return s;
}

llint Person::getFinalKey() {
    return generatedFinalKey;
}
