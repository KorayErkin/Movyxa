// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_two/src/common/constants/size_constants.dart';
import 'package:project_two/src/common/constants/translation_constants.dart';
import 'package:project_two/src/common/extensions/size_extensions.dart';
import 'package:project_two/src/common/extensions/string_extensions.dart';
import 'package:project_two/src/domain/entities/video_entity.dart';
import 'package:project_two/src/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:project_two/src/presentation/themes/theme_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;

  const WatchVideoScreen({
    Key? key,
    required this.watchVideoArguments,
  }) : super(key: key);

  @override
  _WatchVideoScreenState createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late List<VideoEntity> _videos;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _videos = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
      initialVideoId: _videos[0].key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColor.whiteIconColor,
        ),
        title: Text(
          TranslationConstants.watchTrailers.t(context),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          progressIndicatorColor: AppColor.greenBgColor,
          progressColors: const ProgressBarColors(
            playedColor: AppColor.greenBgColor,
            handleColor: AppColor.greenBgColor,
          ),
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < _videos.length; i++)
                        Container(
                          height: 60.h.toDouble(),
                          padding: EdgeInsets.symmetric(
                            vertical: Sizes.dimen_8.h.toDouble(),
                          ),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  _controller.load(_videos[i].key);
                                  _controller.play();
                                },
                                child: CachedNetworkImage(
                                  width: Sizes.dimen_200.w.toDouble(),
                                  imageUrl: YoutubePlayer.getThumbnail(
                                    videoId: _videos[i].key,
                                    quality: ThumbnailQuality.high,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w.toDouble(),
                                  ),
                                  child: Text(
                                    _videos[i].title,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
