import 'package:go_router/go_router.dart';
import 'package:tmdb_ui/core/utils/router/routes.dart';
import 'package:tmdb_ui/features/bottom_nav/presentation/pages/bottom_nav.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: BOTTOM_NAV,
      builder: (context, state) => const BottomNav(),
      routes: const [
        // GoRoute(
        //   path: DETAIL,
        //   builder: (context, state) {
        //     return const PostWithCommentsScreen();
        //   },
        // ),
      ],
    ),
  ],
);
