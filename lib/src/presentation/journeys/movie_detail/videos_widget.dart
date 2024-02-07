// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_two/src/common/constants/route_constants.dart';
import 'package:project_two/src/common/constants/size_constants.dart';
import 'package:project_two/src/common/constants/translation_constants.dart';
import 'package:project_two/src/common/extensions/size_extensions.dart';
import 'package:project_two/src/presentation/blocs/videos/videos_bloc.dart';
import 'package:project_two/src/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:project_two/src/presentation/widgets/button.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;

  const VideosWidget({
    Key? key,
    required this.videosBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videosBloc,
      builder: (context, state) {
        if (state is VideosLoaded && state.videos.iterator.moveNext()) {
          final _videos = state.videos;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_10.w.toDouble(),
            ),
            child: Button(
              text: TranslationConstants.watchTrailers,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RouteList.watchTrailer,
                  arguments: WatchVideoArguments(_videos),
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
