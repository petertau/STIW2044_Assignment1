import 'package:flutter/material.dart';
import 'package:lab_1/screens/MovieHomePage.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MoviesApp',
      home: MovieHomePage() ,
    );
  }
}

