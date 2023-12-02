import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_ui/core/utils/constants/constant_colors.dart';
import 'package:tmdb_ui/core/utils/constants/constants.dart';
import 'package:tmdb_ui/core/utils/router/router.dart';
import 'package:tmdb_ui/dependency_injection.dart';
import 'package:tmdb_ui/features/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/bloc/trending_movies_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<TrendingMoviesBloc>(
          create: (_) => getIt<TrendingMoviesBloc>(),
        ),
        BlocProvider<MovieDetailBloc>(
          create: (_) => getIt<MovieDetailBloc>(),
        )
      ],
      child: MaterialApp.router(
        title: 'TMDB',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: ConstantColors.appPrimaryColor)),
        builder: (context, child) {
          deviceWidth = MediaQuery.sizeOf(context).width;
          deviceHeight = MediaQuery.sizeOf(context).height;
          deviceAverageSize = (deviceWidth + deviceHeight) / 2;
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: ScrollConfiguration(behavior: MyBehavior(), child: child!),
          );
        },
        routerConfig: router,
        // home: const BottomNav(),
      )));
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
