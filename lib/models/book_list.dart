import 'books.dart';
import 'users.dart';

class BooksList {
  List<Book> addedBooks = [];
  DateTime dateAdded;

  BooksList({required this.addedBooks, required this.dateAdded});
}

List<BooksList> wishLists = [];
List<BooksList> favorites = [];
