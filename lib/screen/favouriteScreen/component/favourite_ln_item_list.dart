import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:page_transition/page_transition.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';
import '../../../generated/image.dart';
import '../../novelScreen/novel_screen.dart';

class FavouriteLnItemList extends StatelessWidget {
  const FavouriteLnItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FavouriteLnItem(
          title: "Sword Art Online",
          overview: "In 2022, a virtual reality massively multiplayer online role-playing game (VRMMORPG) called Sword Art Online (SAO) was released. With the NerveGear, a helmet that stimulates the user's five senses via their brain, players can experience and control their in-game characters with their minds. Both the game and the NerveGear were created by Akihiko Kayaba. On November 6, 10,000 players log into SAO's mainframe cyberspace for the first time, only to discover that they are unable to log out. Kayaba appears and tells the players that they must beat all 100 floors of Aincrad, a steel castle which is the setting of SAO, if they wish to be free. He also states that those who suffer in-game deaths or forcibly remove the NerveGear out-of-game will suffer real-life deaths.",
          image: lnSao,
          releaseDate: "Release on: 2018/12/20",
        ),
        FavouriteLnItem(
          title: "Re: Zero Kara Hajimeru Isekai Seikatsu",
          overview: "Suddenly, high school student Natsuki Subaru has been summoned to another world on the way back from the convenience store. After being summoned to another world and no sign of the one who summoned him, things become worse when he is attacked. However, when he is saved by a mysterious silver-haired girl and her companion, a spirit named Puck, Subaru cooperates with the girl to return the favor by helping to find something that was stolen from her. When they finally manage to get a clue and go to the place it was gonna be sold Subaru and the girl are mysteriously attacked and killed by someone. Subaru then awakens hours before his and the silver haired girls death. After dying a couple more times with the same result he dubs his ability 'Return by Death'.",
          image: lnReZero,
          releaseDate: "Release on: 2019/11/21",
        ),
      ],
    );
  }
}

class FavouriteLnItem extends StatelessWidget {
  const FavouriteLnItem({
    super.key,
    required this.title,
    required this.overview,
    required this.image,
    required this.releaseDate,
  });

  final String title;
  final String overview;
  final String image;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            alignment: Alignment.center,
            curve: Curves.ease,
            duration: const Duration(milliseconds: 500),
            child: const NovelScreen(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sizeWidth(context) * 0.04, vertical: sizeHeight(context) * 0.02),
        padding: EdgeInsets.all(
          sizeWidth(context) * 0.02,
        ),
        width: sizeWidth(context),
        height: sizeHeight(context) * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: sizeWidth(context) * 0.35,
              ),
            ),
            SizedBox(
              width: sizeWidth(context) * 0.02,
            ),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: fontsSVNGilroyBold,
                          color: normalTextColor,
                          height: sizeHeight(context) * 0.0015,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        overview,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: fontsSVNGilroyRegular,
                          color: normalTextColor,
                          height: sizeHeight(context) * 0.0015,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Text(
                      releaseDate,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: fontsSVNGilroyRegular,
                        color: greyTextColor,
                        height: sizeHeight(context) * 0.0015,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
