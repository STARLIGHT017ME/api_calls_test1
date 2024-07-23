import 'package:flutter/material.dart';

class Circularprogress extends StatefulWidget {
  final double progress;
  final Color color;
  const Circularprogress(
      {super.key, required this.progress, required this.color});

  @override
  State<Circularprogress> createState() => _CircularprogressState();
}

class _CircularprogressState extends State<Circularprogress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation = Tween(begin: 0.0, end: widget.progress).animate(controller);
    controller.forward(from: 0.0);
  }

  @override
  void didUpdateWidget(Circularprogress oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      animation = Tween(begin: oldWidget.progress, end: widget.progress)
          .animate(controller);
      controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  strokeWidth: 6.0,
                  value: animation.value,
                  color: widget.color,
                ),
              ),
              Text(
                "${(animation.value * 100).toInt()}%",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          );
        });
  }
}
