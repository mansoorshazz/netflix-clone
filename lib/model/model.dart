import 'dart:convert';
import 'package:http/http.dart' as http;

List upComing = [];
List topRated = [];
List tvShows = [];
List trending = [];
List nowPlaying = [];
List latest = [];
List tvAirToday = [];

final upcomingUrl = Uri.parse(
    'https://api.themoviedb.org/3/movie/upcoming?api_key=127fd9bce0836421c10f9fe9ac5d8d61&language=en-US&page=1');

final topRatedUrl = Uri.parse(
    'https://api.themoviedb.org/3/movie/top_rated?api_key=127fd9bce0836421c10f9fe9ac5d8d61&language=en-US&page=1');

final tvShowUrl = Uri.parse(
    'https://api.themoviedb.org/3/tv/popular?api_key=127fd9bce0836421c10f9fe9ac5d8d61&language=en-US&page=1');

final trendingUrl = Uri.parse(
    "https://api.themoviedb.org/3/trending/all/day?api_key=127fd9bce0836421c10f9fe9ac5d8d61");

final nowPlayingUrl = Uri.parse(
    'https://api.themoviedb.org/3/movie/now_playing?api_key=127fd9bce0836421c10f9fe9ac5d8d61&language=en-US&page=1');

final latestUrl = Uri.parse(
    'https://api.themoviedb.org/3/tv/top_rated?api_key=127fd9bce0836421c10f9fe9ac5d8d61&language=en-US&page=1');

final tvAirTodayUrl = Uri.parse(
    'https://api.themoviedb.org/3/tv/airing_today?api_key=127fd9bce0836421c10f9fe9ac5d8d61&language=en-US&page=1');

getUpComing() async {
  final response = await http.get(upcomingUrl);
  Map data = json.decode(response.body);
  upComing = data['results'];
  return upComing;
}

getTopRated() async {
  final response = await http.get(topRatedUrl);
  Map data = json.decode(response.body);
  topRated = data['results'];
  return topRated;
}

getTvshow() async {
  final response = await http.get(tvShowUrl);
  Map data = json.decode(response.body);
  tvShows = data['results'];
  return tvShows;
}

getTrending() async {
  final response = await http.get(trendingUrl);
  Map data = json.decode(response.body);
  trending = data['results'];
  return trending;
}

getNowPlaying() async {
  final response = await http.get(nowPlayingUrl);
  Map data = json.decode(response.body);
  nowPlaying = data['results'];
  return nowPlaying;
}

getLastest() async {
  final response = await http.get(latestUrl);
  Map data = json.decode(response.body);
  latest = data['results'];
  return latest;
}

getTvairToday() async {
  final response = await http.get(tvAirTodayUrl);
  Map data = json.decode(response.body);
  tvAirToday = data['results'];
  return tvAirToday;
}
