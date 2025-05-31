import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController {
  final RxBool _isHovered = false.obs;

  bool get isHovered => _isHovered.value;

  void setHover(bool value) {
    if (_isHovered.value != value) {
      _isHovered.value = value;
    }
  }
}

class SidbarAnimation extends StatefulWidget {
  final Widget child;
  final String? hoverText;
  final double scaleFactor;

  const SidbarAnimation({
    super.key,
    required this.child,
    this.hoverText,
    this.scaleFactor = 1.2,
  });

  @override
  State<SidbarAnimation> createState() => _SidbarAnimationState();
}

class _SidbarAnimationState extends State<SidbarAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  final SidebarController sidebarController = Get.find<SidebarController>();
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scaleFactor)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    sidebarController._isHovered.listen((isHovered) {
      if (_isDisposed) return;
      if (isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (!_isDisposed) sidebarController.setHover(true);
      },
      onExit: (_) {
        if (!_isDisposed) sidebarController.setHover(false);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ScaleTransition(
            scale: _scaleAnimation,
            child: widget.child,
          ),
          if (widget.hoverText != null)
            Positioned(
              left: 40,
              top: 0,
              bottom: 0,
              child: Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return child;
                    // return FadeTransition(
                    //   opacity: animation,
                    //   child: child,
                    // );
                  },
                  layoutBuilder:
                      (Widget? currentChild, List<Widget> previousChildren) {
                    return Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        ...previousChildren,
                        if (currentChild != null) currentChild,
                      ],
                    );
                  },
                  child: sidebarController.isHovered
                      ? _HoverTextWidget(
                          key: UniqueKey(), // مفتاح فريد مطلق
                          text: widget.hoverText!,
                        )
                      : _EmptyWidget(key: UniqueKey()), // مفتاح فريد مطلق
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class PathSidbarAnimation extends StatefulWidget {
  final Widget child;

  const PathSidbarAnimation({super.key, required this.child});

  @override
  State<PathSidbarAnimation> createState() => _PathSidbarAnimationState();
}

class _PathSidbarAnimationState extends State<PathSidbarAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  final SidebarController sidebarController = Get.find<SidebarController>();
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 2.7).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    sidebarController._isHovered.listen((isHovered) {
      if (_isDisposed) return;
      if (isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (!_isDisposed) sidebarController.setHover(true);
      },
      onExit: (_) {
        if (!_isDisposed) sidebarController.setHover(false);
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.diagonal3Values(_scaleAnimation.value, 1.0, 1.0),
            alignment: Alignment.centerLeft,
            child: widget.child,
          );
        },
      ),
    );
  }
}

class HoverScale extends StatefulWidget {
  final Widget child;

  const HoverScale({super.key, required this.child});

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (!_isDisposed) _controller.forward();
      },
      onExit: (_) {
        if (!_isDisposed) _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}

// ويدجت مخصصة للنص لتجنب إعادة البناء غير الضرورية
class _HoverTextWidget extends StatelessWidget {
  final String text;

  const _HoverTextWidget({required Key key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ));
  }
}

// ويدجت مخصصة للحالة الفارغة
class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
