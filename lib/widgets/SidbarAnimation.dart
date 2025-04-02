import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

// الـ Controller لإدارة حالة الهوفر المشتركة
class SidebarController extends GetxController {
  RxBool isHovered = false.obs;

  void setHovered(bool value) {
    isHovered.value = value;
  }
}

// SidbarAnimation مع النص والتكبير
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
  _SidbarAnimationState createState() => _SidbarAnimationState();
}

class _SidbarAnimationState extends State<SidbarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final SidebarController sidebarController = Get.find<SidebarController>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scaleFactor)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    ever(sidebarController.isHovered, (isHovered) {
      isHovered ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => sidebarController.setHovered(true),
      onExit: (_) => sidebarController.setHovered(false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Transform.scale(
              scale: _scaleAnimation.value,
              child: widget.child,
            ),
          ),
          if (widget.hoverText != null)
            Positioned(
              left: 40,
              top: 0,
              bottom: 0,
              child: Obx(
                () => sidebarController.isHovered.value
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.hoverText!,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )
                            .animate()
                            .slideX(
                                duration: const Duration(milliseconds: 250),
                                delay: const Duration(milliseconds: 1))
                            .fade(duration: const Duration(milliseconds: 500)),
                      )
                    : SizedBox.shrink(),
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
  _PathSidbarAnimationState createState() => _PathSidbarAnimationState();
}

class _PathSidbarAnimationState extends State<PathSidbarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final SidebarController sidebarController = Get.find<SidebarController>();

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

    ever(sidebarController.isHovered, (isHovered) {
      isHovered ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        // حساب العرض الجديد بناءً على التكبير
        final double originalWidth = 100; // افتراض أن العرض الأصلي 100
        final double scaledWidth = originalWidth * _scaleAnimation.value;

        return MouseRegion(
          onEnter: (_) => sidebarController.setHovered(true),
          onExit: (_) => sidebarController.setHovered(false),
          child: Container(
            width: scaledWidth, // تحديث العرض ديناميكيًا
            child: Transform(
              transform:
                  Matrix4.diagonal3Values(_scaleAnimation.value, 1.0, 1.0),
              alignment: Alignment.centerLeft,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}

class HoverScale extends StatefulWidget {
  final Widget child;

  const HoverScale({super.key, required this.child});

  @override
  _HoverScaleState createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale>
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
        Tween<double>(begin: 1.0, end: 1.2).animate(CurvedAnimation(
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
