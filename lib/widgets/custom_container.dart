import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  final Color color;
  final String image;
  final bool isSelected;

  const ColoredContainer({
    Key? key,
    required this.color,
    required this.image,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          border: isSelected
              ? Border.all(
                  color: Colors.black,
                  width: 1.5,
                )
              : null,
        ),
        child: Image.network(image),
      ),
    );
  }
}
