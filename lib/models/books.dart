import 'users.dart';

class Book {
  String title;
  String author;
  String genre;
  String description;
  String? publishingDate;
  User offering;
  String isbn;
  String language;

  Book(
      {required this.title,
      required this.author,
      required this.description,
      required this.genre,
      required this.offering,
      this.publishingDate,
      required this.isbn,
      required this.language});
}

List<Book> books = [];
