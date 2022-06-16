import 'package:flutter/material.dart';

class Book {
  String? pic;
  String name;
  String author;
  String genre;
  String description;
  String language;

  Book({
    this.pic,
    required this.name,
    required this.author,
    required this.description,
    required this.genre,
    required this.language,
  });
}

List<Book> books = [];
