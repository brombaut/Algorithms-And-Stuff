/**
 * From The C Programming Language
 */

#include <stdlib.h>

typedef long Align;  /* for allignment to long boundary */

union header {  /* block header */
    struct {
        union header *ptr;  /* next block if on free list */
        unsigned int size;  /* size of this block */
    } s;
    Align x;  /* force alignment of blocks -- never actually used */
};

typedef union header Header;


static Header base;  /* empty list to get started */
static Header *freep = NULL;  /* start of free list */

/* mMalloc: general-purpose storage allocator */
void *mMalloc(unsigned int nbytes) {
    Header *p, *prevp;
    Header *morecore(unsigned);
    unsigned int nunits;

    /* Round up to the proper number of header-sized units, plus 1 for the header itself */
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
    if ((prevp = freep) == NULL) {  /* no free list yet */
        base.s.ptr = freep = prevp = &base;
        base.s.size = 0;
    }
    for (p = prevp->s.ptr; ; prevp = p, p = p->s.ptr) {
        if (p->s.size >= nunits) {  /* big enough */
            if (p->s.size == nunits) {  /* exactly */
                prevp->s.ptr = p->s.ptr;
            }
            else {  /* allocates tail end */
                p->s.size -= nunits;
                p += p->s.size;
                p->s.size = nunits;
            }
            freep = prevp;
            return (void *)(p + 1);
        }
        if (p == freep) {  /* wrapped around free list */
            if ((p = morecore(nunits)) == NULL) {
                return NULL;  /* none left */
            }
        }
    }
}


#define NALLOC 1024  /* minimum #units to request */

/* morecore: ask system for more memory */
static Header *morecore(unsigned int nu) {
    char *cp, *sbrk(int);
    Header *up;

    if (nu < NALLOC) {
        nu = NALLOC;
    }
    cp = sbrk(nu * sizeof(Header));
    if (cp == (char *) -1) {  /* no free space at all */
        return NULL;
    }
    up = (Header *) cp;
    up->s.size = nu;
    mFree((void *)(up + 1));
    return freep;
}

/* put block ap in free list */
void mFree(void *ap) {
    Header *bp, *p;

    bp = (Header *)ap - 1;  /* point to block header */
    for (p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
            break;  /* freed block at start or end of arena */
        }
    }

    if (bp + bp->s.size == p->s.ptr) {  /* join to upper nbr */
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
    }
    else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {  /* join to lower nbr */
        p->s.size += bp->s.size;
        p->s.ptr = bp->s.ptr;
    }
    else {
        p->s.ptr = bp;
    }

    freep = p;
}