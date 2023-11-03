import 'package:cached_network_image/cached_network_image.dart';
import 'package:everestcamp_task/core/constants/image_constant.dart';
import 'package:everestcamp_task/core/core.dart';
import 'package:everestcamp_task/ui/src/app_text_styles.dart';

import '../../../ui/ui.dart';

class MovieDetailBaseView extends StatefulWidget {
  const MovieDetailBaseView({
    super.key,
    required this.imageURl,
    required this.movieDescription,
    required this.movieTitle,
    required this.movieRating,
    required this.releaseDate,
  });

  final num movieRating;
  final String movieTitle;
  final String imageURl;
  final String movieDescription;
  final String releaseDate;

  @override
  State<MovieDetailBaseView> createState() => _MovieDetailBaseViewState();
}

class _MovieDetailBaseViewState extends State<MovieDetailBaseView> {
  @override
  Widget build(BuildContext context) {
    dPrint('Selected image URL:${widget.imageURl}');
    dPrint('Selected image URL:${widget.movieDescription}');
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: widget.imageURl,
                height: .5.sh,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movieTitle,
                      style: AppTextStyles.head,
                    ),
                    gapH4,
                    Row(
                      children: [
                        const Icon(Icons.star),
                        gapW8,
                        Text(
                          widget.movieRating.toString(),
                          style: AppTextStyles.hintText,
                        ),
                      ],
                    ),
                    gapH4,
                    Divider(
                      thickness: 1,
                      endIndent: 5.w,
                      indent: 5.w,
                      color: const Color(0xff515151),
                    ),
                    Text(
                      'Release Date:',
                      style: AppTextStyles.title,
                    ),
                    gapH4,
                    Text(
                      widget.releaseDate,
                      style: AppTextStyles.hintText.copyWith(
                          fontStyle: FontStyle.italic, fontSize: 14.0),
                    ),
                    gapH4,
                    Divider(
                      thickness: 1,
                      endIndent: 5.w,
                      indent: 5.w,
                      color: const Color(0xff515151),
                    ),
                    Text(
                      'Synopsis:',
                      style: AppTextStyles.title,
                    ),
                    gapH4,
                    Text(
                      widget.movieDescription,
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            top: 30.h,
            left: 10.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
              ),
            ))
      ],
    ));
  }
}
