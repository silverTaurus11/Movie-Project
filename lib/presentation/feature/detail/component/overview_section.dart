import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class OverviewSection extends StatelessWidget {
  final String overview;

  const OverviewSection({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.overview,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(overview, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
