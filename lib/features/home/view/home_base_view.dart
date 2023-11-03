import 'package:everestcamp_task/core/constants/app_constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../ui/src/app_text_styles.dart';
import '../../../ui/ui.dart';
import '../logic/home_view_provider.dart';
import 'widgets/movie_card.dart';
import 'widgets/search_text_field.dart';

class HomeBaseView extends ConsumerStatefulWidget {
  const HomeBaseView({super.key});

  @override
  ConsumerState<HomeBaseView> createState() => _HomeBaseViewState();
}

class _HomeBaseViewState extends ConsumerState<HomeBaseView> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    viewModel = ref.read(moodViewModelProvider.notifier)..getMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final state = ref.watch(moodViewModelProvider);
              return Column(
                children: [
                  Text(
                    'Find movies and Tv Series..',
                    style: AppTextStyles.head,
                  ),
                  gapH12,
                  const SearchTextField(),
                  gapH12,
                  Expanded(
                    child: state.movieList.when(data: (data) {
                      return data.isEmpty
                          ? Center(
                              child: Text(
                                'Sorry no movie found',
                                style: AppTextStyles.title,
                              ),
                            )
                          : SingleChildScrollView(
                              child: GridView.custom(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverQuiltedGridDelegate(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 16.w,
                                    crossAxisSpacing: 16.w,
                                    repeatPattern:
                                        QuiltedGridRepeatPattern.same,
                                    pattern: [
                                      const QuiltedGridTile(2, 2),
                                      const QuiltedGridTile(2, 2),
                                      const QuiltedGridTile(2, 4),
                                      const QuiltedGridTile(4, 2),
                                      const QuiltedGridTile(2, 2),
                                      const QuiltedGridTile(2, 2),
                                    ],
                                  ),
                                  childrenDelegate: SliverChildBuilderDelegate(
                                    childCount: data.length,
                                    (context, index) {
                                      return MovieCard(
                                        posterPath:
                                            data[index].posterPath ?? '',
                                        movieTitle: data[index].title ?? '',
                                        onMovieClick: () {
                                          final movie=data[index];
                                          viewModel.goToMovieDetailPage(
                                            context: context,
                                            imageUrl:
                                                '${AppConstants.imagePosterBaseUrl}${data[index].posterPath}',
                                            movieDescription:
                                                movie.overview ?? '',
                                            movieTitle:
                                                movie.originalTitle ?? '',
                                            movieRating:
                                                movie.voteAverage ?? 0,
                                            releaseDate:
                                                movie.releaseDate ?? '',
                                          );
                                        },
                                      );
                                    },
                                  )),
                            );
                    }, error: (_, __) {
                      return gap0;
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
