#include <string>
#include <iostream>
#include "booksort.h"

// QUICKSORT IMPLEMENTATION
int bookPartition(Book** books, int low, int high)
{
    Book *pivot = books[high];
    int split = low;
    
    for (int ii = low; ii < high; ii++)
    {
        if (books[ii]->GetBookID() < pivot->GetBookID())
        {
            //Increase split and put smaller element to the left of it
            Book* temp = books[ii];
            books[ii] = books[split];
            books[split] = temp;
            split++;
        }
    }

    Book* temp = books[split];
    books[split] = books[high];
    books[high] = temp;

    return split;
}

void bookQuickSort(Book** books, int low, int high)
{
    if (low < high)
    {
        //Partition the array, then recursively call on the subsets
        int split = bookPartition(books, low, high);

        //Recursively sort the splits
        bookQuickSort(books, low, split - 1);
        bookQuickSort(books, split + 1, high);
    }
    
    //Otherwise, we are done
}

Book ** makeBooks(int num, int* values)
{
    Book** books = (Book**)malloc(sizeof(Book*) * num);
    
    for (int ii = 0; ii < num; ii++)
    {
        //Make the books reverse sorted
        Book* book = new Book;
        book->SetBookName("Book " + std::to_string(values[ii]));
        book->SetBookISBN("B_" + std::to_string(values[ii]));
        book->SetBookID(values[ii]);

        books[ii] = book;
    }

    return books;
}

int main(void)
{
    int numBooks = 10;
    int values[10] = {12, 35, 456, 53, 5311, 1531, -1, 4242, 12, 11};
    // int values[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    // int values[10] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    // int values[10] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

    //Create the books
    Book** books = makeBooks(numBooks, values);

    // Display the inital state of all books
    std::cout << "Pre-sort:\n";
    for (int ii = 0; ii < numBooks; ii++)
    {
        std::cout << "Book " << ii << ": " << books[ii]->GetBookName() << "\n";
    }

    //Sort the books
    bookQuickSort(books, 0, numBooks - 1);
    
    std::cout << "Post-sort:\n";
    for (int ii = 0; ii < numBooks; ii++)
    {
        std::cout << "Book " << ii << ": " << books[ii]->GetBookName() << "\n";
    }

    //Free memory
    for (int ii = 0; ii < numBooks; ii++)
    {
        delete books[ii];
    }
    free(books);

    return 0;
}