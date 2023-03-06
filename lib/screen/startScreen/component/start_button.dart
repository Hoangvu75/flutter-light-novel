import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:light_novel/generated/color.dart';
import 'package:light_novel/generated/dimension.dart';
import 'package:light_novel/generated/fontFamily.dart';
import 'package:light_novel/screen/mainScreen/main_screen.dart';
import 'package:page_transition/page_transition.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            curve: Curves.ease,
            duration: const Duration(seconds: 1),
            child: MainScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: sizeHeight(context) * 0.02,
          horizontal: sizeWidth(context) * 0.12,
        ),
        decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(15)),
        child: Text(
          "Start",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontFamily: fontsSVNGilroyMedium,
                color: Colors.white,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
