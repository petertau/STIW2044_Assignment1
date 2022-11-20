import 'package:flutter/material.dart';
import 'package:lab_1/models/Movie.dart' as models;

class MovieItem extends StatelessWidget {
  final models.Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 8, left: 10, right: 10),
      decoration:
          const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: <Widget>[
            if (movie.poster != "N/A")
              Image.network(movie.poster, height: 100, width: 100)
          ]),
          Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(movie.year),
                Text(movie.type)
              ]),)
        ],
      ),
    );
  }
}