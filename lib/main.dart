import 'package:flutter/material.dart';
import 'package:notesapp/pages/home.dart';
import 'package:notesapp/pages/notes.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Home(),
        '/notes': (context) => const Notes(),
      },
    ),
  );
}
