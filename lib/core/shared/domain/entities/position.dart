class Position {
  final int x;
  final int y;

  Position({
    required this.x,
    required this.y,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      x: json['x'],
      y: json['y'],
    );
  }

  int manhattanDistance(Position other) {
    return (x - other.x).abs() + (y - other.y).abs();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Position && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() {
    return 'Position(x: $x, y: $y)';
  }
}
