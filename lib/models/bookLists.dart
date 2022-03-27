import 'books.dart';
import 'users.dart';

class BooksList {
  User user;
  List<Book> addedBooks = [];
  DateTime dateAdded;

  BooksList(
      {required this.user, required this.addedBooks, required this.dateAdded});
}

List<BooksList> wishLists = [];
List<BooksList> favorites = [];
