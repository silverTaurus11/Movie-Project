import 'package:flutter/material.dart';

class RatingCircle extends StatelessWidget {
  final double rating;

  const RatingCircle({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final percent = (rating * 10).round();
    final progress = rating / 10;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black87,
        shape: BoxShape.circle
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: 1,
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(Colors.grey.shade800)
          ),

          CircularProgressIndicator(
            value: progress,
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
            backgroundColor: Colors.transparent,
          ),

          Text(
            '$percent%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
