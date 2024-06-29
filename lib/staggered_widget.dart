import 'package:flutter/material.dart';

class StaggeredWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final String name;

  const StaggeredWidget({
    required this.image,
    required this.height,
    required this.width,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black.withOpacity(0.7),
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
