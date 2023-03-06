import 'package:flutter/material.dart';

import '../../generated/color.dart';
import '../../generated/dimension.dart';
import '../../generated/fontFamily.dart';
import '../../generated/image.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: sizeHeight(context) * 0.05,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(sizeWidth(context) * 0.35),
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
                    width: sizeWidth(context) * 0.35,
                    height: sizeWidth(context) * 0.35,
                  ),
                ),
              ),
              SizedBox(
                height: sizeHeight(context) * 0.04,
              ),
              Text(
                "Kirito",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontFamily: fontsSVNGilroyBold,
                      color: normalTextColor,
                    ),
              ),
              SizedBox(
                height: sizeHeight(context) * 0.01,
              ),
              Text(
                "Kirigaya Kazuto",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontFamily: fontsSVNGilroyRegular,
                      fontStyle: FontStyle.italic,
                      color: greyTextColor,
                    ),
              ),
              SizedBox(
                height: sizeHeight(context) * 0.04,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: sizeWidth(context) * 0.04,
                ),
                padding: EdgeInsets.all(sizeWidth(context) * 0.04),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          Text(
                            "Following",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontFamily: fontsSVNGilroyBold,
                                  color: normalTextColor,
                                ),
                          ),
                          SizedBox(
                            height: sizeHeight(context) * 0.01,
                          ),
                          Text(
                            "127",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontFamily: fontsSVNGilroyBold,
                                  color: primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: sizeHeight(context) * 0.05,
                      width: 1,
                      color: greyTextColor,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          Text(
                            "Followers",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontFamily: fontsSVNGilroyBold,
                                  color: normalTextColor,
                                ),
                          ),
                          SizedBox(
                            height: sizeHeight(context) * 0.01,
                          ),
                          Text(
                            "6938",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontFamily: fontsSVNGilroyBold,
                                  color: primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: sizeHeight(context) * 0.05,
                      width: 1,
                      color: greyTextColor,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          Text(
                            "Likes",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontFamily: fontsSVNGilroyBold,
                                  color: normalTextColor,
                                ),
                          ),
                          SizedBox(
                            height: sizeHeight(context) * 0.01,
                          ),
                          Text(
                            "372",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontFamily: fontsSVNGilroyBold,
                                  color: primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sizeHeight(context) * 0.02,
              ),
              Container(
                width: sizeWidth(context),
                margin: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: sizeWidth(context) * 0.04,
                ),
                padding: EdgeInsets.all(sizeWidth(context) * 0.04),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Settings",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontFamily: fontsSVNGilroyRegular,
                                color: normalTextColor,
                              ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.settings,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          "Change password",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontFamily: fontsSVNGilroyRegular,
                                color: normalTextColor,
                              ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.lock,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          "Private policy",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontFamily: fontsSVNGilroyRegular,
                                color: normalTextColor,
                              ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.privacy_tip_outlined,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          "Notifications",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontFamily: fontsSVNGilroyRegular,
                                color: normalTextColor,
                              ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.notifications,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          "About & Terms",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontFamily: fontsSVNGilroyRegular,
                                color: normalTextColor,
                              ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.info_outline,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          "Log out",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontFamily: fontsSVNGilroyRegular,
                                color: normalTextColor,
                              ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.exit_to_app_outlined,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
