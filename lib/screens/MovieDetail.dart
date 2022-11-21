import 'package:flutter/material.dart';
import 'package:lab_1/services/MovieService.dart';
import 'package:lab_1/models/MovieInfo.dart';
import 'package:lab_1/components/PaddedText.dart';

class MovieDetail extends StatelessWidget {
  final String movieName;
  final String imdbId;

  const MovieDetail({super.key, required this.movieName, required this.imdbId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieName),
      ),
      body: FutureBuilder<MovieInfo>(
          future: getMovie(imdbId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          alignment: Alignment.center,
                          child: Image.network(
                            snapshot.data!.poster,
                            width: 180,
                          ),
                        ),
                        Text(snapshot.data!.plot, textAlign: TextAlign.justify),
                        PaddedText("Year : ${snapshot.data!.year}"),
                        PaddedText("Genre : ${snapshot.data!.genre}"),
                        PaddedText("Directed by : ${snapshot.data!.director}"),
                        PaddedText("Runtime : ${snapshot.data!.runtime}"),
                        PaddedText("Rated : ${snapshot.data!.rating}"),
                        PaddedText("IMDB Rating : ${snapshot.data!.imdbRating}"),
                        PaddedText("Meta Score : ${snapshot.data!.metaScore}"),
                      ]));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}