import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lab_1/models/Movie.dart';
import 'package:lab_1/models/MovieInfo.dart';

const API_KEY = "c830c96e";
const API_URL = "http://www.omdbapi.com/?apikey=";

Future<List<Movie>> searchMovies(keyword) async {
  var url = Uri.parse('$API_URL$API_KEY&s=$keyword');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
      var list =
          (data['Search'] as List).map((item) => Movie.fromJson(item)).toList();
      return list;
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}

Future<MovieInfo> getMovie(movieId) async {
  var url = Uri.parse('$API_URL$API_KEY&i=$movieId');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    var data = json.decode(response.body);

    if (data['Response'] == "True") {
      return MovieInfo.fromJSON(data);
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}
