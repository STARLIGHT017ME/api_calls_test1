import 'package:flutter/material.dart';

class Neumorphism extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Widget? child;
  final ListTile? tile;

  const Neumorphism(
      {super.key,
      this.child,
      this.tile,
      required this.height,
      required this.width,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        /* 250 */
        height: height,
        /* 150 */
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
          boxShadow: const [
            BoxShadow(
                /* bottom right  shadow is darker*/
                blurRadius: 1,
                color: Colors.grey,
                spreadRadius: 1,
                offset: Offset(4, 4)),
            BoxShadow(
              /* top left shadow is darker */
              blurRadius: 1,
              color: Colors.white,
              spreadRadius: 1,
              offset: Offset(-6, -6),
            ),
          ],
        ),
        child: tile,
      ),
    );
  }
}
