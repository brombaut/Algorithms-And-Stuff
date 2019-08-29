/**
 * Exercise from The C Programming Language
 * 
 * Pseudo code:
 * while (next operator or operand is not end-of-file indicator)
 *   if (number)
 *     push it
 *   else if (operator)
 *     pop operands
 *     do operation
 *     push result
 *   else if (newline)
 *     pop and print top of stack
 *   else
 *     error
 */

#include <stdio.h>
#include <stdlib.h>

#define MAXOP 1000  /* max size of operand or operator */
#define NUMBER '0'  /* signal that a number was found */

int getop(char []);
void push(double);
double pop(void);

/* Reverse Polish Calculator */
int main() {
    int type;
    double op2;
    char s[MAXOP];
    
    while ((type = getop(s)) != EOF) {
        switch (type) {
            case NUMBER: {
                push(atof(s));
                break;
            }
            case '+': {
                push(pop() + pop());
                break;
            }
            case '*': {
                push(pop() * pop());
                break;
            }
            case '-': {
                op2 = pop();        /* The left and right operands must be distinguished for '-' and '/'. */
                push(pop() - op2);  /* The order in which the two calls to pop)_ are evaluated is not defined. */
                break;              /* To guarentee the right order, it is necessary to pop the second operator first into it's own variable */
            }
            case '/': {
                op2 = pop();
                if (op2 != 0.0) {
                    push(pop() / op2);
                } else {
                    printf("Error: Zero divisor\n");
                }
                break;
            }
            case '\n': {
                printf("\t%.8g\n", pop());
                break;
            }
            default: {
                printf("Error: Unknown command %s\n", s);
                break;
            }
        }
    }
    return 0;
}


#define MAXVAL 100  /* maximum depth of val stack */

int sp = 0;  /* next free stack position */
double val[MAXVAL]; /* value stack */

/* push: push f onto value stack */
void push(double f) {
    if (sp < MAXVAL) {
        val[sp++] = f;
    } else {
        printf("Error: Stack fulle, can't push %g\n", f);
    }
}

/* pop: pop and return top value from stack */
double pop(void) {
    if (sp > 0) {
        return val[--sp];
    } else {
        printf("Error: Stack empty\n");
        return 0.0;
    }
}


#include <ctype.h>

int getch(void);
void ungetch(int);

/* getop: Get next operator or numeric operand */
/* Skip blanks and tabs. If the next character is not a digit or a decimal point, return it. */
/* Otherwise, collect a string of digits (which might include a decimal point), and return NUMBER, */
/* the signal that a number has been collected */
int getop(char s[]) {
    int i, c;
    while ((s[0] = c = getch()) == ' ' || c == '\t') { }

    s[1] = '\0';
    if (!isdigit(c) && c != '.') {
        return c;  /* not a number */
    }
    i = 0;
    if (isdigit(c)) {
        while (isdigit(s[++i] = c = getch())) { }  /* collect integer part */
    }
    if (c == '.' ){
        while (isdigit(s[++i] = c = getch())) { }  /* collect fraction part */
    }
    s[i] = '\0';
    if (c != EOF) {
        ungetch(c);
    }
    return NUMBER;
}


#define BUFSIZE 100

char buf[BUFSIZE];  /* buffer for ungetch */
int bufp = 0;  /* next free position in buf */

/* get a (possible pushed back) character */
int getch(void) {
    return (bufp > 0) ? buf[--bufp] : getchar();
}

/* push character back on input */
void ungetch(int c) {
    if (bufp >= BUFSIZE) {
        printf("ungetch: too many characters\n");
    } else {
        buf[bufp++] = c;
    }
}