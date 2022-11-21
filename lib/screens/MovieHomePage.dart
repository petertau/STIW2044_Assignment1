import 'package:flutter/material.dart';
import 'package:lab_1/components/MovieList.dart';
import 'package:lab_1/screens/MovieDetail.dart';
import 'package:lab_1/services/MovieService.dart';
import 'package:lab_1/models/Movie.dart';
import 'package:flutter/services.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  MovieHomePageState createState() => MovieHomePageState();
}

class MovieHomePageState extends State<MovieHomePage> {
  final searchTextController = TextEditingController();
  String searchText = "";

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void itemClick(Movie item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieDetail(
                movieName: item.title,
                imdbId: item.imdbID,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPress(context),
      child: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Search Movies')),
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: searchTextController,
                      decoration: const InputDecoration(
                          hintText: 'Enter a search term'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    tooltip: 'Search Movies',
                    onPressed: () {
                      setState(() {
                        searchText = searchTextController.text;
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                      });
                    },
                  ),
                ]),
              ),
              if (searchText.isNotEmpty)
                FutureBuilder<List<Movie>>(
                    future: searchMovies(searchText),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                            child: MovieList(
                                movies: snapshot.data ?? [],
                                itemClick: itemClick));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
            ],
          )),
    );
  }
}

Future<bool> _onBackButtonPress(BuildContext context) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text("Do you want to close the app?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("No"),
            ),
          ],
        );
      });
      return exitApp;
}
