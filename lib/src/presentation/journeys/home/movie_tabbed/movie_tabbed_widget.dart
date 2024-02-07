// ignore_for_file: library_private_types_in_public_api, unnecessary_overrides, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_two/src/common/constants/size_constants.dart';
import 'package:project_two/src/common/constants/translation_constants.dart';
import 'package:project_two/src/common/extensions/size_extensions.dart';
import 'package:project_two/src/common/extensions/string_extensions.dart';
import 'package:project_two/src/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:project_two/src/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:project_two/src/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:project_two/src/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';
import 'package:project_two/src/presentation/widgets/app_error_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({super.key});

  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: Sizes.dimen_4.h.toDouble(),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0;
                      i < MovieTabbedConstants.movieTabs.length;
                      i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.movieTabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabbedConstants.movieTabs[i].index ==
                          state.currentTabIndex,
                    )
                ],
              ),
              if (state is MovieTabChanged)
                state.movies.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            TranslationConstants.noMovies.t(context),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      )
                    : Expanded(
                        child: MovieListViewBuilder(movies: state.movies),
                      ),
              if (state is MovieTabLoadError)
                Expanded(
                  child: AppErrorWidget(
                    errorType: state.errorType,
                    onPressed: () => movieTabbedBloc.add(
                      MovieTabChangedEvent(
                        currentTabIndex: state.currentTabIndex,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
