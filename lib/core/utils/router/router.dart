import 'package:go_router/go_router.dart';
import 'package:tmdb_ui/core/utils/constants/endpoints.dart';
import 'package:tmdb_ui/core/utils/router/routes.dart';
import 'package:tmdb_ui/features/bottom_nav/presentation/pages/bottom_nav.dart';
import 'package:tmdb_ui/features/movie_detail/presentation/pages/movie_detail_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: BOTTOM_NAV,
      builder: (context, state) => const BottomNav(),
      routes: [
        GoRoute(
          path: DETAILWithParam,
          name: DETAIL,
          builder: (context, state) {
            return MovieDetailScreen(id: state.pathParameters[ApiParam.id]!);
          },
        ),
      ],
    ),
  ],
);
