import 'package:dummy_project/helper/colors_ext.dart';
import 'package:flutter/material.dart';

class GeneralCard extends StatelessWidget {
  final Widget? child;

  final double? width;

  final double? height;

  final double borderRadius;

  const GeneralCard({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 16,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            blurRadius: borderRadius - 4,
            color: Colors.black.safeOpacity(0.12),
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}
