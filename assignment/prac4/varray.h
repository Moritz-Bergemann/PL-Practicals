#pragma once
#include <stdlib.h>

/**
 * Struct for variable-length array.
 */
typedef struct varray {
    int *arr;
    uint len;
} varray;

