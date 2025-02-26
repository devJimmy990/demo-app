import 'package:demo_app/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/model/factory/shape.dart';
import 'package:demo_app/model/factory/shape_factory.dart';

class FactoryScreen extends StatelessWidget {
  const FactoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShapeFactory shapeFactory = ShapeFactory();

    Shape circle = shapeFactory.getShape(ShapeFactoryType.circle);
    circle.revealMe();

    Shape rectangle = shapeFactory.getShape(ShapeFactoryType.rectangle);
    rectangle.revealMe();

    Shape square = shapeFactory.getShape(ShapeFactoryType.square);
    square.revealMe();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildText("Factory Pattern"),
        _buildShapeCard(circle),
        _buildShapeCard(rectangle),
        _buildShapeCard(square),
      ],
    );
  }
}

Widget _buildShapeCard(Shape shape) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: ListTile(
      leading: SizedBox(
        width: 50,
        child: shape is Circle
            ? _buildCircleShape()
            : shape is Rectangle
                ? _buildRectangleShape()
                : _buildSquareShape(),
      ),
      title: Text("You choose to print: ${shape.revealMe()}"),
    ),
  );
}

Widget _buildCircleShape() => CircleAvatar(
      radius: 30,
    );
Widget _buildSquareShape() => Container(
      width: 40,
      height: 40,
      color: Colors.amber,
    );
Widget _buildRectangleShape() => Container(
      width: 40,
      height: 80,
      color: Colors.red,
    );
