import 'package:flutter/material.dart';

class AnimatedEmojiButton extends StatefulWidget {
  final String emoji;
  final double size;
  final VoidCallback? onTap;

  const AnimatedEmojiButton({
    super.key,
    required this.emoji,
    this.size = 24,
    this.onTap,
  });

  @override
  State<AnimatedEmojiButton> createState() => _AnimatedEmojiButtonState();
}

class _AnimatedEmojiButtonState extends State<AnimatedEmojiButton> {
  double _scale = 1.0;

  void _onTap() async {
    setState(() => _scale = 1.4);

    await Future.delayed(const Duration(milliseconds: 120));

    setState(() => _scale = 1.0);

    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutBack,
        child: Text(widget.emoji, style: TextStyle(fontSize: widget.size)),
      ),
    );
  }
}
