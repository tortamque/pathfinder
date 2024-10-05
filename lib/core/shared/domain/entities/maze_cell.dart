import 'package:flutter/material.dart';

enum MazeCell {
  empty(color: Color(0xFFFFFFFF)),
  blocked(color: Color(0xFF000000)),
  start(color: Color(0xFF64FFDA)),
  end(color: Color(0xFF009688)),
  path(color: Color(0xFF4CAF50));

  final Color color;

  const MazeCell({required this.color});
}
