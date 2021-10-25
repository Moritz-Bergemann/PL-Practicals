#include <string>
// #include <stdio>
#include <iostream>

// Setup book class
class Book
{
private:
    int bookID;
    std::string bookName;
    std::string ISBN;

public:
    int GetBookID();
    std::string GetBookName();
    std::string GetISBN();
    void SetBookID(int);
    void SetBookName(std::string);
    void SetBookISBN(std::string);
    Book();
    ~Book();
};

Book::Book()
{
    bookID = -1;
    bookName = "NULL";
    ISBN = "NULL";
}

Book::~Book()
{
    //Do nothing 🤔
}

std::string Book::GetBookName()
{
    return bookName;
}

std::string Book::GetISBN()
{
    return ISBN;
}

int Book::GetBookID()
{
    return bookID;
}

void Book::SetBookID(int id)
{
    bookID = id;
}

void Book::SetBookName(std::string name)
{
    bookName = name;
}

void Book::SetBookISBN(std::string inISBN)
{
    ISBN = inISBN;
}

// QUICKSORT IMPLEMENTATION

int bookPartition(Book** books, int low, int high)
{
    Book *pivot = books[high];
    int split = low;

    // std::cout << "Doing split - low=" << low << ", high=" << high << "\n";
    // std::cout << "INITIAL STATE OF ARRAY: \n";
    // for (Book* b: books)
    //     std::cout << b << "\n";

    // std::cout << "low is " << low << ", high is " << high << "\n";

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
    std::cout << "Found split " << split << "\n";

    Book* temp = books[split];
    books[split] = books[high];
    books[high] = temp;
    // books[low] = books[high-1];
    std::cout << "FINAL state of array: [";
    for (int ii = 0; ii < 10; ii++)
        std::cout << books[ii]->GetBookID() << ' ';
    std::cout << "]\n";

    return split;
}

void bookQuickSort(Book** books, int low, int high)
{
    std::cout << "Quicksort: low=" << low << ", high=" << high << "\n" << std::flush;
    std::cout << "State of array: [";
    for (int ii = low; ii <= high; ii++)
        std::cout << books[ii]->GetBookID() << ' ';
    std::cout << "]\n";
    if (low < high)
    {
        //Partition the array, then recursively call on the subsets
        int split = bookPartition(books, low, high);

        std::cout << "AFTER FULL state of array: [";
        for (int ii = 0; ii < 10; ii++)
            std::cout << books[ii]->GetBookID() << ' ';
        std::cout << "]\n";

        //Recursively sort the splits
        std::cout << "Doing first recursive call\n" << std::flush;
        bookQuickSort(books, low, split - 1);
        std::cout << "Doing second recursive call\n" << std::flush;
        bookQuickSort(books, split, high);
    }
    
    //Otherwise, we are done
}

using std::to_string;

Book ** makeBooks(int num, int* values)
{
    Book** books = (Book**)malloc(sizeof(Book*) * num);
    
    for (int ii = 0; ii < num; ii++)
    {
        //Make the books reverse sorted
        Book* book = new Book;
        book->SetBookName("Book " + to_string(values[ii]));
        book->SetBookISBN("B_" + to_string(values[ii]));
        book->SetBookID(values[ii]);

        books[ii] = book;
    }

    return books;
}

int main(void)
{
    int numBooks = 10;
    int values[10] = {12, 35, 456, 53, 5311, 1531, -1, 4242, 12, 11};
    // int values[10] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    Book** books = makeBooks(numBooks, values);

    std::cout << "INIT FULL state of array: [";
    for (int ii = 0; ii < 10; ii++)
        std::cout << books[ii]->GetBookID() << ' ';
    std::cout << "]\n";

    Book *c = new Book;

    c->SetBookName("Bean Book");
    c->SetBookISBN("BNS123");
    c->SetBookID(123);

    std::cout << "Book " + c->GetBookName() + "\n";

    delete c;

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

    return 0;
}