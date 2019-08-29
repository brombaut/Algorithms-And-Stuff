#ifndef PERSON_H
#define PERSON_H

typedef long long int llint;
 
class Person
{
private:
    llint p;  /* Public prime number */
    llint g;  /* Public primitive root of P */
    llint s;  /* Private Individual Key -- never shared*/
    llint generatedFinalKey;  /* The final secret key that no one else can see, but the other person has calculated the same one */
    
    llint powerMod(llint a, llint b, llint P);  /* Power function to return value of a ^ b mod P */

public:
    Person();
    
    void setPandG(llint pIn, llint gIn);
    void setRandomPrivateKey();
    void setFinalKey(llint partnersPartialKey);

    llint getPartialKey();
    llint getP();
    llint getG();
    llint getPrivateKey();
    llint getFinalKey();
};
 
#endif