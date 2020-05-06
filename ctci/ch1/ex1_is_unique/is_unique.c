#include <stdio.h>

char isUnique(char *s) {
    int charArray[26];
    for (int i=0; i < 26; ++i) {
        charArray[i] = 0;
    }
    char c = *s++;
    while(c) {
        if (charArray['z' - c]) {
            return 0;
        }
        charArray['z' - c] = 1;
        c = *s++;
    }
    return 1;
}

int main() {
    char result = isUnique("tesi");
    if (result) {
        printf("%s\n", "Is Unique");
    } else {
        printf("%s\n", "Is Not Unique");
    }
    return 0;
}