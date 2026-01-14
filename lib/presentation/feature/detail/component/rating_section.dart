import 'package:dummy_project/presentation/feature/component/rating_circle.dart';
import 'package:dummy_project/presentation/feature/detail/component/animated_emoji_button.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class RatingSection extends StatelessWidget {
  final double rating;
  final VoidCallback? onHappyTap;
  final VoidCallback? onLoveTap;
  final VoidCallback? onMindBlowTap;

  const RatingSection({
    super.key,
    required this.rating,
    this.onHappyTap,
    this.onLoveTap,
    this.onMindBlowTap,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          RatingCircle(rating: rating),
          const SizedBox(width: 10),
          Text(
            loc.user_score,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
          AnimatedEmojiButton(emoji: '😄', onTap: onHappyTap),
          const SizedBox(width: 4),
          AnimatedEmojiButton(emoji: '😍', onTap: onLoveTap),
          const SizedBox(width: 4),
          AnimatedEmojiButton(emoji: '🤯', onTap: onMindBlowTap),
        ],
      ),
    );
  }
}
