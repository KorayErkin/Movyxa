import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_two/src/common/constants/size_constants.dart';
import 'package:project_two/src/common/extensions/size_extensions.dart';
import 'package:project_two/src/common/screenutil/screenutil.dart';
import 'package:project_two/src/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:project_two/src/presentation/journeys/search_movie/custom_search_movie_delegate.dart';
import 'package:project_two/src/presentation/widgets/logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w.toDouble(),
        right: Sizes.dimen_16.w.toDouble(),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/svg/menu.svg',
              height: Sizes.dimen_8.h.toDouble(),
            ),
          ),
          const Expanded(
            child: Logo(
              height: Sizes.dimen_14,
            ),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                  BlocProvider.of<SearchMovieBloc>(context),
                ),
              );
            },
            icon: SvgPicture.asset(
              'assets/svg/search.svg',
              height: Sizes.dimen_8.h.toDouble(),
            ),
          ),
        ],
      ),
    );
  }
}
