import 'package:pathfinder/core/shared/domain/entities/position.dart';

class AStarNode {
  final Position position;
  final int g;
  final int f;

  AStarNode(this.position, this.g, this.f);
}
