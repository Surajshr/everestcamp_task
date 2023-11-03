import 'package:everestcamp_task/core/core.dart';
import 'package:everestcamp_task/features/movie_detail/view/movie_detail_base_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/locator/locator.dart';
import '../../../core/models/movie_model.dart';
import '../../../core/routing/routing.dart';
import '../../../core/services/movie_services/movie.dart';
import '../../../core/utils/debauncer.dart';
import '../../../ui/ui.dart';


part 'home_view_provider.freezed.dart';

part 'home_view_state.dart';

part 'home_view_model.dart';

final moodViewModelProvider =
StateNotifierProvider<HomeViewModel, HomeViewState>((ref) {
  final goRouter = ref.read(goRouterProvider);
  return HomeViewModel(
    goRouter,
  );
});
