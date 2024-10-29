import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ScreenConfettiWidget extends StatefulWidget {
  const ScreenConfettiWidget({super.key});

  @override
  State<ScreenConfettiWidget> createState() => _ScreenConfettiWidgetState();
}

class _ScreenConfettiWidgetState extends State<ScreenConfettiWidget> {
  late ConfettiController controller;

  @override
  void initState() {
    super.initState();
    controller = ConfettiController();
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
        ),
      ],
    );
  }
}
