import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thisisjerico/colors/theme_colors/classic.dart';

import '../../colors/colors.dart';

class AnimatedHexagon extends StatefulWidget {
  final double size;
  final double radius; // Add the radius parameter

  const AnimatedHexagon({
    Key? key,
    required this.size,
    required this.radius,  // Initialize the radius parameter
  }) : super(key: key);

  @override
  _AnimatedHexagonState createState() => _AnimatedHexagonState();
}

class _AnimatedHexagonState extends State<AnimatedHexagon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Phase 1 Animations
  late List<Animation<double>> phase1X;
  late List<Animation<double>> phase1Y;

  // Phase 3 Animations (Intermediate Positions)
  late List<Animation<double>> phase3X;
  late List<Animation<double>> phase3Y;

  // Phase 4 Final Circular Animations
  late List<Animation<double>> phase4X;
  late List<Animation<double>> phase4Y;

  final double angularSpeed = 2 * pi / 8; // Speed of rotation for Phase 5

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10), // 20 seconds for forward, 20 seconds for reverse
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(); // Reverse animation after forward completes
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward(); // Restart forward animation
      }
    });

    // Phase 1: Outward movement
    phase1X = List.generate(8, (i) {
      return Tween<double>(begin: 0.0, end: _phase1X(i)).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0, 0.125, curve: Curves.easeInOut), // Phase 1: 0–12.5%
        ),
      );
    });

    phase1Y = List.generate(8, (i) {
      return Tween<double>(begin: 0.0, end: _phase1Y(i)).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0, 0.125, curve: Curves.easeInOut), // Phase 1: 0–12.5%
        ),
      );
    });

    // Phase 3: Transition to intermediate positions (12.5% - 18.75%)
    phase3X = List.generate(8, (i) {
      return Tween<double>(begin: _phase1X(i), end: _phase3X(i)).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.125, 0.1875, curve: Curves.easeInOut)),
      );
    });

    phase3Y = List.generate(8, (i) {
      return Tween<double>(begin: _phase1Y(i), end: _phase3Y(i)).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.125, 0.1875, curve: Curves.easeInOut)),
      );
    });

    // Phase 4: Transition to circular positions (18.75% - 25%)
    final double angleIncrement = 2 * pi / 8; // Divide circle into 8 parts
    phase4X = List.generate(8, (i) {
      final angle = i * angleIncrement;
      return Tween<double>(begin: _phase3X(i), end: widget.radius * cos(angle)).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.1875, 0.25, curve: Curves.easeInOut)),
      );
    });

    phase4Y = List.generate(8, (i) {
      final angle = i * angleIncrement;
      return Tween<double>(begin: _phase3Y(i), end: widget.radius * sin(angle)).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.1875, 0.25, curve: Curves.easeInOut)),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = [
      Color(0xFFD4AF37), // Gold (Bright): Primary theme gold
      Color(0xFFB3922A), // Gold (Muted): Darker variant of gold
      Color(0xFF023F8C), // Navy Blue (Rich): Primary theme navy blue
      Color(0xFF022F6B), // Navy Blue (Muted): Darker variant of navy blue
      Color(0xFFE1DBB1), // Darker beige (still neutral but more visible)

      Color(0xFFB5A89D), // Warm Gray: Sophisticated neutral for contrast
      Color(0xFF8C6E3F), // Bronze: Adds depth and a luxurious tone
      Color(0xFF3E3E3E), // Charcoal Gray: Grounds the palette with a strong neutral
    ];

    return Stack(
      alignment: Alignment.centerLeft,
      children: List.generate(8, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double currentX = 0.0;
            double currentY = 0.0;

            if (_controller.value <= 0.125) {
              // Phase 1
              currentX = phase1X[index].value;
              currentY = phase1Y[index].value;
            } else if (_controller.value <= 0.1875) {
              // Phase 3
              currentX = phase3X[index].value;
              currentY = phase3Y[index].value;
            } else if (_controller.value <= 0.25) {
              // Phase 4
              currentX = phase4X[index].value;
              currentY = phase4Y[index].value;
            } else {
              // Phase 5: Circular motion
              final angle = (_controller.value - 0.25) * 2 * pi; // Circular angle calculation
              currentX = widget.radius * cos(angle + index * angularSpeed);
              currentY = widget.radius * sin(angle + index * angularSpeed);
            }

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..translate(currentX, currentY),
              child: _hexagon(colors[index % colors.length]),
            );
          },
        );
      }),
    );
  }

  // Helper Functions for Phase 1 and 3 positions
  double _phase1X(int index) {
    final offsets = [50.0, 50.0, 0.0, 0.0, -50.0, -50.0, 0.0, 0.0]; // Reduced by 50%
    return offsets[index];
  }

  double _phase1Y(int index) {
    final offsets = [0.0, 0.0, 50.0, 50.0, 0.0, 0.0, -50.0, -50.0]; // Reduced by 50%
    return offsets[index];
  }

  double _phase3X(int index) {
    final offsets = [25.0, 25.0, -25.0, -25.0, -25.0, -25.0, 25.0, 25.0]; // Reduced by 50%
    return offsets[index];
  }

  double _phase3Y(int index) {
    final offsets = [25.0, 25.0, 25.0, 25.0, -25.0, -25.0, -25.0, -25.0]; // Reduced by 50%
    return offsets[index];
  }

  Widget _hexagon(Color color) {
    return ClipPath(
      clipper: HexagonClipper(),
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: color.withOpacity(1),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    final Path path = Path();

    path.moveTo(width * 0.5, 0); // Top center
    path.lineTo(width, height * 0.25); // Top-right
    path.lineTo(width, height * 0.75); // Bottom-right
    path.lineTo(width * 0.5, height); // Bottom center
    path.lineTo(0, height * 0.75); // Bottom-left
    path.lineTo(0, height * 0.25); // Top-left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
