import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSwitcher extends StatefulWidget {
  final Function(bool) onLanguageToggle; // دالة للتعامل مع تغيير اللغة

  const LanguageSwitcher({Key? key, required this.onLanguageToggle}) : super(key: key);

  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher>
    with SingleTickerProviderStateMixin {
  bool isArabic = false; // الحالة الأولية: الإنجليزية
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 3, end: 45).animate(_controller);
  }

  void _toggleLanguage() {
    setState(() {
      isArabic = !isArabic;
      if (isArabic) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      widget.onLanguageToggle(isArabic);
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLanguage,
      child: Container(
        width: 70,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: Get.theme.primaryColor
          ),
          color: isArabic ? Colors.white : Get.theme.primaryColor,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  left: _animation.value, // موضع الكرة
                  child: Container(

                    alignment: Alignment.center,
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: isArabic ? Get.theme.primaryColor : Colors.white  ,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
              isArabic ? MainAxisAlignment.end :
                  MainAxisAlignment.start
              ,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    isArabic ? 'العربية' : 'English',
                    style:  TextStyle(
                      fontFamily: "Sansation",
                      color: isArabic ? Get.theme.primaryColor : Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}