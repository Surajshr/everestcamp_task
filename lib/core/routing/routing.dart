import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/home/view/home_base_view.dart';
import '../../ui/src/common_widget/error_page_view.dart';
import '../../ui/ui.dart';

enum AppRoute { splash, homePage, movieDetail }

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: false,
      redirectLimit: 10,
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.splash.name,
          builder: (context, state) {
            return const HomeBaseView();
          },
        ),
      ],
      errorPageBuilder: (context, state) => MaterialPage(
        child: ErrorView(
          key: state.pageKey,
          error: state.error,
        ),
      ),
    );
  },
);
