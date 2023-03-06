import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:light_novel/bloc/categorySelector/category_selector_state.dart';
import 'package:light_novel/bloc/scrollController/scroll_controller_bloc.dart';
import 'package:light_novel/generated/image.dart';
import 'package:light_novel/screen/novelScreen/novel_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';

class NovelList extends StatelessWidget {
  const NovelList({
    super.key,
    required this.categorySelectorState,
  });

  final CategorySelectorState categorySelectorState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewestNovels(
          categorySelectorState: categorySelectorState,
        ),
        SizedBox(
          height: sizeHeight(context) * 0.03,
        ),
        PopularNovels(
          categorySelectorState: categorySelectorState,
        ),
        SizedBox(
          height: sizeHeight(context) * 0.03,
        ),
        TrendingNovels(
          categorySelectorState: categorySelectorState,
        ),
      ],
    );
  }
}

class NewestNovels extends StatelessWidget {
  NewestNovels({
    super.key,
    required this.categorySelectorState,
  });

  final CategorySelectorState categorySelectorState;

  final List<LnItem> allNewestNovels = [
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
  ];

  final List<LnItem> romanceNewestNovels = [
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
  ];

  final List<LnItem> actionsNewestNovels = [
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
  ];

  final List<LnItem> ecchiNewestNovels = [
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
  ];

  final List<LnItem> hentaiNewestNovels = [
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<List<LnItem>> listLnList = [
      allNewestNovels,
      romanceNewestNovels,
      actionsNewestNovels,
      ecchiNewestNovels,
      hentaiNewestNovels,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizeWidth(context) * 0.04,
          ),
          child: Text(
            "Newest novels",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontFamily: fontsSVNGilroyMedium,
                  color: normalTextColor,
                  height: sizeHeight(context) * 0.0015,
                ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...listLnList[categorySelectorState.position],
            ],
          ),
        ),
      ],
    );
  }
}

class PopularNovels extends StatelessWidget {
  PopularNovels({
    super.key,
    required this.categorySelectorState,
  });

  final CategorySelectorState categorySelectorState;

  final List<LnItem> allNewestNovels = [
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
  ];

  final List<LnItem> romanceNewestNovels = [
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
  ];

  final List<LnItem> actionsNewestNovels = [
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
  ];

  final List<LnItem> ecchiNewestNovels = [
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
  ];

  final List<LnItem> hentaiNewestNovels = [
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<List<LnItem>> listLnList = [
      allNewestNovels,
      romanceNewestNovels,
      actionsNewestNovels,
      ecchiNewestNovels,
      hentaiNewestNovels,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizeWidth(context) * 0.04,
          ),
          child: Text(
            "Popular novels",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontFamily: fontsSVNGilroyMedium,
                  color: normalTextColor,
                  height: sizeHeight(context) * 0.0015,
                ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...listLnList[categorySelectorState.position],
            ],
          ),
        ),
      ],
    );
  }
}

class TrendingNovels extends StatelessWidget {
  TrendingNovels({
    super.key,
    required this.categorySelectorState,
  });

  final CategorySelectorState categorySelectorState;

  final List<LnItem> allNewestNovels = [
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
  ];

  final List<LnItem> romanceNewestNovels = [
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
  ];

  final List<LnItem> actionsNewestNovels = [
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
  ];

  final List<LnItem> ecchiNewestNovels = [
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
  ];

  final List<LnItem> hentaiNewestNovels = [
    LnItem(
      novelName: "Sword Art Online",
      authorName: "Kawahara Reki",
      novelImage: lnSao,
    ),
    LnItem(
      novelName: "Re: Zero Kara Hajimeru Isekai Seikatsu",
      authorName: "Tappei Nagatsuki",
      novelImage: lnReZero,
    ),
    LnItem(
      novelName: "Goblin Slayer",
      authorName: "Kagyu Kumo",
      novelImage: lnGoblinSlayer,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<List<LnItem>> listLnList = [
      allNewestNovels,
      romanceNewestNovels,
      actionsNewestNovels,
      ecchiNewestNovels,
      hentaiNewestNovels,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizeWidth(context) * 0.04,
          ),
          child: Text(
            "Trending novels",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontFamily: fontsSVNGilroyMedium,
                  color: normalTextColor,
                  height: sizeHeight(context) * 0.0015,
                ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...listLnList[categorySelectorState.position],
            ],
          ),
        ),
      ],
    );
  }
}

class LnItem extends StatelessWidget {
  const LnItem({
    super.key,
    required this.novelName,
    required this.authorName,
    required this.novelImage,
  });

  final String novelName;
  final String authorName;
  final String novelImage;

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
        width: sizeWidth(context) * 0.42,
        margin: EdgeInsets.symmetric(
          horizontal: sizeWidth(context) * 0.04,
          vertical: sizeHeight(context) * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: sizeHeight(context) * 0.3,
              width: sizeWidth(context) * 0.42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 4.0,
                    spreadRadius: 4.0,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  novelImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: sizeHeight(context) * 0.015,
            ),
            Text(
              novelName,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontFamily: fontsSVNGilroyBold,
                    color: normalTextColor,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: sizeHeight(context) * 0.005,
            ),
            Text(
              authorName,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontFamily: fontsSVNGilroyRegular,
                    fontStyle: FontStyle.italic,
                    color: greyTextColor,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
