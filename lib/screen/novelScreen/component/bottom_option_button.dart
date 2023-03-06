import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:light_novel/generated/fontFamily.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';

class BottomOptionButton extends StatelessWidget {
  const BottomOptionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: lightPrimaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        width: sizeWidth(context),
        padding: EdgeInsets.symmetric(vertical: sizeWidth(context) * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ScaleTap(
              onPressed: () {},
              child: Container(
                width: sizeWidth(context) * 0.45,
                padding: EdgeInsets.symmetric(
                  vertical: sizeHeight(context) * 0.02,
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Read Preview",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontFamily: fontsSVNGilroyMedium,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ScaleTap(
              onPressed: () {},
              child: Container(
                width: sizeWidth(context) * 0.45,
                padding: EdgeInsets.symmetric(
                  vertical: sizeHeight(context) * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Buy for 30% sale",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontFamily: fontsSVNGilroyMedium,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
