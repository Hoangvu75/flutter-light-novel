import 'package:flutter/material.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizeWidth(context) * 0.04,
          ),
          child: Text(
            "Welcome back, Kirito!",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontFamily: fontsSVNGilroyRegular,
              color: greyTextColor,
              height: sizeHeight(context) * 0.0015,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: sizeHeight(context) * 0.01,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizeWidth(context) * 0.04,
          ),
          child: Text(
            "What do you want to read today?",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontFamily: fontsSVNGilroySemiBold,
              color: normalTextColor,
              height: sizeHeight(context) * 0.0015,
            ),
          ),
        ),
      ],
    );
  }
}
