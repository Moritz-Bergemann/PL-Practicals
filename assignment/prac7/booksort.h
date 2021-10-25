#ifndef BOOKSORT_H
#define BOOKSORT_H

#include "book.h"

int bookPartition(Book** books, int low, int high);
void bookQuickSort(Book** books, int low, int high);
Book ** makeBooks(int num, int* values);

#endif