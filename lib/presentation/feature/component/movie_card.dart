import 'package:dummy_project/presentation/feature/component/aync_image.dart';
import 'package:dummy_project/presentation/feature/component/general_card.dart';
import 'package:dummy_project/presentation/feature/component/rating_circle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieCard extends StatelessWidget {
  final int id;
  final String title;
  final String posterUrl;
  final double voteAverage;
  final String releaseDate;

  const MovieCard({
    super.key,
    required this.title,
    required this.posterUrl,
    required this.voteAverage,
    required this.releaseDate,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralCard(
      borderRadius: 16,
      onTap: () {
        context.go('/movies/$id');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                AsyncImage(
                  imagePath: posterUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),

                Positioned(
                  left: 8,
                  bottom: 8,
                  child: RatingCircle(rating: voteAverage),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  releaseDate,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
