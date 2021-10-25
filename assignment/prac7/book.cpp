#include <string>

#include "book.h"

// Setup book class
Book::Book()
{
    bookID = -1;
    bookName = "NULL";
    ISBN = "NULL";
}

Book::~Book()
{
    //Do nothing
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