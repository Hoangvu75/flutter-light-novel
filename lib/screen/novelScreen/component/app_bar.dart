import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:light_novel/bloc/scrollController/scroll_controller_state.dart';
import 'package:light_novel/generated/fontFamily.dart';
import 'package:light_novel/generated/image.dart';

import '../../../bloc/scrollController/scroll_controller_bloc.dart';
import '../../../generated/color.dart';
import '../../../generated/dimension.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollControllerBloc, ScrollControllerState>(builder: (context, scrollControllerState) {
      return SliverAppBar(
        leading: ScaleTap(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            size: sizeWidth(context) * 0.1,
            color: scrollControllerState.isOnTop ? primaryColor : Colors.white,
          ),
        ),
        leadingWidth: sizeWidth(context) * 0.15,
        pinned: true,
        snap: false,
        floating: false,
        expandedHeight: sizeHeight(context) * 0.3,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: FlexibleSpaceBar(
            title: Text(
              scrollControllerState.isOnTop ? "Novel details" : "",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontFamily: fontsSVNGilroyBold,
                color: primaryColor,
              ),
            ),
            centerTitle: true,
            background: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        lnSaoBg,
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Opacity(
                    opacity: 0.6,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: sizeHeight(context) * 0.02,
                  left: sizeWidth(context) * 0.04,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Novel details",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontFamily: fontsSVNGilroyRegular,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: sizeHeight(context) * 0.01,
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Sword Art Online",
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontFamily: fontsSVNGilroyBold,
                              color: Colors.white,
                            ),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      );
    });
  }
}
