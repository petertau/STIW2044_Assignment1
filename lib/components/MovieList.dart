import 'package:flutter/material.dart';
import 'package:lab_1/components/MovieItem.dart';
import 'package:lab_1/models/Movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final Function itemClick;

  const MovieList({super.key, required this.movies, required this.itemClick});

  @override
  Widget build(context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.grey),
        child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  child: MovieItem(movie: movies[index]),
                  onTap: () => itemClick(movies[index]));
            }));
  }
}