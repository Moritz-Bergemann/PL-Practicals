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

Book::Book() {
    bookID = -1;
    bookName = "NULL";
    ISBN = "NULL";
}

Book::~Book() {
    //Do nothing 🤔
}

std::string Book::GetBookName() {
    return bookName;
}

std::string Book::GetISBN() {
    return ISBN;
}

void Book::SetBookID(int id) {
    bookID = id;
}

void Book::SetBookName(std::string name) {
    bookName = name;
}

void Book::SetBookISBN(std::string inISBN) {
    ISBN = inISBN;
}

Book** makeBooks() {
    Book* a = new book;
    a->SetBookName("Book A");
    a->SetBookISBN("B1A");
    a->SetBookID(1);

    Book* b = new book;
    b->SetBookName("Book B");
    b->SetBookISBN("B2B");
    b->SetBookID(2);
    
    Book* arr[] = {a, b};

    return arr;
}

int main(void) {
    Book *arr[] = makeBooks();

    Book *c = new Book;

    c->SetBookName("Bean Book");
    c->SetBookISBN("BNS123");
    c->SetBookID(123);

    std::cout << "Book " + c->GetBookName() + "\n";
    
    delete c;

    return 0;
}