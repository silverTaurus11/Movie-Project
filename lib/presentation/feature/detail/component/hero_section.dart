import 'package:dummy_project/helper/colors_ext.dart';
import 'package:dummy_project/helper/string_ext.dart';
import 'package:dummy_project/presentation/feature/component/aync_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/model/movie_item.dart';

class HeroSection extends StatelessWidget {
  final Movie movie;

  const HeroSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AsyncImage(
          imagePath: movie.backdropPath.toImageW780Url(),
          height: 280,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 280,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.safeOpacity(0.4),
                Colors.black.safeOpacity(0.9),
              ],
            ),
          ),
        ),

        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 8,
          child: Material(
            color: Colors.black54,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => context.pop(),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AsyncImage(
                imagePath: movie.posterPath.toImageW185Url(),
                width: 90,
                height: 130,
                fit: BoxFit.cover,
                radius: 8,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '${movie.title}\n(${movie.releaseDate.substring(0, 4)})',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
