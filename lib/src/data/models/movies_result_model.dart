// ignore_for_file: prefer_collection_literals, unnecessary_this, unnecessary_null_comparison

import 'package:project_two/src/data/models/movie_model.dart';

class MoviesResultModel {
  List<MovieModel> movies;

  MoviesResultModel({
    required this.movies,
  });

  MoviesResultModel.fromJson(Map<String, dynamic> json)
      : movies = List<MovieModel>.from(
          json['results']?.map((v) => MovieModel.fromJson(v)) ?? [],
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    if (this.movies != null) {
      data['results'] = this.movies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
