#include <string>
// #include <stdio>
#include <iostream>
#include <vector>

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

int bookPartition(std::vector<Book *> books, int low, int high)
{
    Book *pivot = books[high];
    int split = low - 1;

    for (int ii = low; ii < high; ii++)
    {
        if (books[ii]->GetBookID() < pivot->GetBookID())
        {
            //Increase split and put smaller element to the left of it
            split++;
            Book* temp = books[ii];
            books[ii] = books[split - 1];
            books[split - 1] = temp;
        }
    }

    return split;
}

void bookQuickSort(std::vector<Book *> books, int low, int high)
{
    if (low < high)
    {
        //Partition the array, then recursively call on the subsets
        int split = bookPartition(books, low, high);

        //Recursively sort the splits
        bookQuickSort(books, low, split - 1);
        bookQuickSort(books, split, high);
    }
    
    //Otherwise, we are done
}

using std::to_string;

std::vector<Book *> makeBooks(int num)
{
    std::vector<Book *> books;

    for (int ii = 0; ii < num; ii++)
    {
        //Make the books reverse sorted
        int bookNum = num - ii;

        Book* book = new Book;
        book->SetBookName("Book " + to_string(bookNum));
        book->SetBookISBN("B_" + to_string(bookNum));
        book->SetBookID(bookNum);

        books.push_back(book);
    }

    return books;
}

int main(void)
{
    std::vector<Book *> books = makeBooks(10);

    Book *c = new Book;

    c->SetBookName("Bean Book");
    c->SetBookISBN("BNS123");
    c->SetBookID(123);

    std::cout << "Book " + c->GetBookName() + "\n";

    delete c;

    for (int ii = 0; ii < books.size(); ii++)
    {
        std::cout << "Book " << ii << ": " << books[ii]->GetBookName() << "\n";
    }

    //Sort the books
    bookQuickSort(books, 0, books.size() - 1);
    
    std::cout << "Post-sort:\n";

    for (int ii = 0; ii < books.size(); ii++)
    {
        std::cout << "Book " << ii << ": " << books[ii]->GetBookName() << "\n";
    }

    return 0;
}