import 'package:firebase_database/firebase_database.dart';

class BooksServices {
  final DatabaseReference _bookRef =
      FirebaseDatabase.instance.ref().child('books');

  Query getBookQuery() {
    return _bookRef;
  }
}
