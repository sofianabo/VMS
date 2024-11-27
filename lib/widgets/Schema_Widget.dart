import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class SchemaWidget extends StatelessWidget {
   SchemaWidget({
    super.key,
    required this.width,
    required this.height,
     this.radius,

  });
  double width;
  double height;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Color(0xffF3F4F8),
          borderRadius: BorderRadius.all(Radius.circular(radius??2))
      ),

    );
  }
}
