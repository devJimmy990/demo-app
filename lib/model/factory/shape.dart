sealed class Shape {
  String revealMe();
}

class Circle implements Shape {
  @override
  String revealMe() => "Circle";
}

class Rectangle implements Shape {
  @override
  String revealMe() => "Rectangle";
}

class Square implements Shape {
  @override
  String revealMe() => "Square";
}
