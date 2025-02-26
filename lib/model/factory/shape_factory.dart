import 'package:demo_app/model/factory/shape.dart';

enum ShapeFactoryType { circle, rectangle, square }

class ShapeFactory {
  Shape getShape(ShapeFactoryType shapeType) {
    switch (shapeType) {
      case ShapeFactoryType.circle:
        return Circle();
      case ShapeFactoryType.rectangle:
        return Rectangle();
      case ShapeFactoryType.square:
        return Square();
    }
  }
}
