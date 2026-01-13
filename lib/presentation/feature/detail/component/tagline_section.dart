import 'package:flutter/material.dart';

class TaglineSection extends StatelessWidget {
  final String tagline;

  const TaglineSection({super.key, required this.tagline});

  @override
  Widget build(BuildContext context) {
    if (tagline.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        tagline,
        style: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.white70,
        ),
      ),
    );
  }
}