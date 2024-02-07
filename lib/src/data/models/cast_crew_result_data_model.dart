// ignore_for_file: overridden_fields, annotate_overrides

import 'package:project_two/src/domain/entities/cast_entity.dart';

class CastCrewResultModel {
  int id;
  List<CastModel> cast;
  List<Crew> crew;

  CastCrewResultModel({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory CastCrewResultModel.fromJson(Map<String, dynamic> json) {
    return CastCrewResultModel(
      id: json['id'],
      cast: List<CastModel>.from(
        json['cast'].map(
          (x) => CastModel.fromJson(x),
        ),
      ),
      crew: List<Crew>.from(
        json['crew'].map(
          (x) => Crew.fromJson(x),
        ),
      ),
    );
  }
}

class CastModel extends CastEntity {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  const CastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  }) : super(
          creditId: creditId,
          name: name,
          posterPath: profilePath,
          character: character,
        );

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'] ?? "",
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }
}

class Crew {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  String creditId;
  String department;
  String job;

  Crew({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'] ?? "",
      creditId: json['credit_id'],
      department: json['department'],
      job: json['job'],
    );
  }
}
