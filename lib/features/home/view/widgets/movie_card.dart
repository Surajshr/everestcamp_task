import 'package:cached_network_image/cached_network_image.dart';
import 'package:everestcamp_task/core/constants/app_constants.dart';
import 'package:everestcamp_task/core/constants/image_constant.dart';
import 'package:everestcamp_task/ui/src/app_text_styles.dart';
import 'package:everestcamp_task/ui/ui.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.posterPath,
    required this.movieTitle,
    this.onMovieClick,
  });

  final String posterPath;
  final String movieTitle;
  final VoidCallback? onMovieClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onMovieClick,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
        // height: 150.h,
        // width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ]),
                  height: 150.h,
                  width: 1.sw,
                  child: CachedNetworkImage(
                    imageUrl: '${AppConstants.imagePosterBaseUrl}$posterPath',
                    height: 150.r,
                    width: 1.sw,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (_, __, ___) => Image.asset(
                      AppImageUrl.splashImage,
                      height: 150.r,
                      width: 1.sw,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            gapH4,
            Text(
              movieTitle,
              style: AppTextStyles.body.copyWith(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
