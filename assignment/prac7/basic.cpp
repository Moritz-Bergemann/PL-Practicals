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

    // Book* temp = books[split];
    // books[split] = books[high];
    // books[high] = temp;
    books[low] = books[high-1];
    std::cout << "FINAL state of array: [";
    for (Book* b: books)
        std::cout << b->GetBookID() << ' ';
    std::cout << "]\n";

    return split + 1;
}

void bookQuickSort(std::vector<Book *> books, int low, int high)
{
    std::cout << "Quicksort: low=" << low << ", high=" << high << "\n" << std::flush;
    std::cout << "State of array: [";
    for (Book* b: books)
        std::cout << b->GetBookID() << ' ';
    std::cout << "]\n";
    if (low < high)
    {
        //Partition the array, then recursively call on the subsets
        int split = bookPartition(books, low, high);

        std::cout << "AFTER state of array: [";
        for (Book* b: books)
            std::cout << b->GetBookID() << ' ';
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