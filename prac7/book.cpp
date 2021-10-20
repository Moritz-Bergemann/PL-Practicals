#include book.h
#include <string>


Book::Book() {
    bookID = -1;
    bookName = "NULL";
    ISBN = "NULL";
}

std::string Book::GetBookName() {
    return bookName;
}

std::string Book::GetISBN() {
    return ISBN;
}

Book::SetBookID(int id) {
    bookId = id;
}

Book::SetBookName(std::string name) {
    bookName = name;
}

Book::SetBookISBN(std::string inISBN) {
    ISBN = inISBN;
}
