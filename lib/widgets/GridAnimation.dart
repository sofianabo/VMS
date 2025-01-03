import 'package:flutter/material.dart';

class HoverScaleCard extends StatefulWidget {
  final Widget child;

  const HoverScaleCard({Key? key, required this.child}) : super(key: key);

  @override
  _HoverScaleCardState createState() => _HoverScaleCardState();
}

class _HoverScaleCardState extends State<HoverScaleCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.05).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: widget.child,
          );
        },
      ),
    );
  }
}

class hhh extends StatefulWidget {
  final Widget child;

  const hhh({Key? key, required this.child}) : super(key: key);

  @override
  _hhhState createState() => _hhhState();
}

class _hhhState extends State<hhh> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _offsetAnimation = Tween<double>(begin: 0.0, end: 250.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _offsetAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _offsetAnimation.value),
            child: widget.child,
          );
        },
      ),
    );
  }
}
