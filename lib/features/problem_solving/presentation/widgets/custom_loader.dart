import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 72,
      child: CircularProgressIndicator(
        value: progress,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
