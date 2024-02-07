// ignore_for_file: prefer_collection_literals, unnecessary_this, unnecessary_null_comparison

import 'package:project_two/src/data/models/video_model.dart';

class VideoResultModel {
  late int id;
  late List<VideoModel> videos;

  VideoResultModel({required this.id, required this.videos});

  VideoResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videos = <VideoModel>[];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        videos.add(VideoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.videos != null) {
      data['results'] = this.videos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
