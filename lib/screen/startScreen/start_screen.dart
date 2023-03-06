import 'package:flutter/material.dart';
import 'package:light_novel/generated/color.dart';
import 'package:light_novel/generated/dimension.dart';
import 'package:light_novel/generated/fontFamily.dart';
import 'package:light_novel/generated/image.dart';

import 'component/poster_image_carousel.dart';
import 'component/start_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: sizeWidth(context),
          height: sizeHeight(context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                primaryColor.withOpacity(0.05),
                Colors.white,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PosterImageCarousel(posterImage: [lnSao, lnGoblinSlayer, lnReZero]),
              SizedBox(
                height: sizeHeight(context) * 0.05,
              ),
              Text(
                "Read your favourite light novels",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontFamily: fontsSVNGilroySemiBold,
                      color: normalTextColor,
                    ),
              ),
              SizedBox(
                height: sizeHeight(context) * 0.02,
              ),
              Text(
                "Explore the world of Wibu, be comfortable and enjoy your wibu journey",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontFamily: fontsSVNGilroyRegular,
                      color: greyTextColor,
                      height: sizeHeight(context) * 0.0015,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: sizeHeight(context) * 0.07,
              ),
              const StartButton(),
            ],
          ),
        ),
      ),
    );
  }
}
