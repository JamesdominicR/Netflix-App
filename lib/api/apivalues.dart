import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_app/api/get_from_tmdb/get_from_tmdb.dart';

const apikey = "0f6d6bcf57bd7302257dd7224cbfcbc4";

const tmdbLink = "https://api.themoviedb.org/3";

const apiAccessCode =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZjZkNmJjZjU3YmQ3MzAyMjU3ZGQ3MjI0Y2JmY2JjNCIsInN1YiI6IjYyODdiNGRlOGQyZjhkMDA2NjlkOWE4MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bPhSSv8Kt5k4e3MzlSEqNTHGKPyeLJv6o8HU4KaYzj4";
const imageId = 'https://image.tmdb.org/t/p/w500';
const popularImages = '$tmdbLink/movie/popular?api_key=$apikey';
const trendingToday =
    '$tmdbLink/trending/all/day?api_key=$apikey&language=en-US&page=1';
const top10 = '$tmdbLink/movie/top_rated?api_key=$apikey';
const nowPlaying = '$tmdbLink/movie/now_playing?api_key=$apikey';
const upComing = '$tmdbLink/movie/upcoming?api_key=$apikey';

Future<List<dynamic>> getMovies(String uri) async {
  final response = await http.get(Uri.parse(uri));
  if (response.statusCode == 200) {
    final decodedJson = jsonDecode(response.body);
    // print(decodedJson);

    List<dynamic> list =
        decodedJson['results'].map((item) => ImageOf.fromJson(item)).toList();

    return list;
  } else {
    throw 'Couldn\t get list';
  }
}
