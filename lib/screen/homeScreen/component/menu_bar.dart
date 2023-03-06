import 'package:flutter/material.dart';
import 'package:light_novel/generated/image.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: sizeHeight(context) * 0.02,
        horizontal: sizeWidth(context) * 0.04,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(3, 6),
                ),
              ],
            ),
            padding: EdgeInsets.all(sizeWidth(context) * 0.03),
            child: Column(
              children: [
                Container(
                  height: sizeHeight(context) * 0.005,
                  width: sizeWidth(context) * 0.07,
                  decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.005,
                ),
                Container(
                  height: sizeHeight(context) * 0.005,
                  width: sizeWidth(context) * 0.07,
                  decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.005,
                ),
                Container(
                  height: sizeHeight(context) * 0.005,
                  width: sizeWidth(context) * 0.07,
                  decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeWidth(context) * 0.13),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 4.0,
                  spreadRadius: 3,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                kirito,
                width: sizeWidth(context) * 0.13,
                height: sizeWidth(context) * 0.13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
