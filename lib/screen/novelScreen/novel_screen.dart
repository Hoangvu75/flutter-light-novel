import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_novel/generated/fontFamily.dart';
import 'package:light_novel/screen/novelScreen/component/app_bar.dart';

import '../../bloc/scrollController/scroll_controller_bloc.dart';
import '../../bloc/scrollController/scroll_controller_event.dart';
import '../../generated/color.dart';
import '../../generated/dimension.dart';
import 'component/bottom_option_button.dart';

class NovelScreen extends StatelessWidget {
  const NovelScreen({Key? key}) : super(key: key);

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
          child: BlocProvider(
            create: (context) => ScrollControllerBloc(),
            child: const NovelScreenBody(),
          ),
        ),
      ),
    );
  }
}

class NovelScreenBody extends StatefulWidget {
  const NovelScreenBody({
    super.key,
  });

  @override
  State<NovelScreenBody> createState() => _NovelScreenBodyState();
}

class _NovelScreenBodyState extends State<NovelScreenBody> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset > sizeHeight(context) * 0.225) {
        context.read<ScrollControllerBloc>().add(OnTopEvent());
      } else {
        context.read<ScrollControllerBloc>().add(OutTopEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            const MySliverAppBar(),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.fromLTRB(
                  sizeWidth(context) * 0.04,
                  sizeHeight(context) * 0.04,
                  sizeWidth(context) * 0.04,
                  sizeWidth(context) * 0.015,
                ),
                child: Text(
                  "About the author",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontFamily: fontsSVNGilroyBold,
                        color: normalTextColor,
                      ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: sizeWidth(context) * 0.04,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: sizeWidth(context) * 0.04,
                  vertical: sizeHeight(context) * 0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Text(
                  "Reki Kawahara (川原 礫, Kawahara Reki, born August 17, 1974) is a Japanese light novel author. He is best known as the creator of Sword Art Online and Accel World, both of which have been adapted into anime. He has also written The Isolator.",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: fontsSVNGilroyRegular,
                        color: greyTextColor,
                        height: sizeHeight(context) * 0.0015,
                      ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: sizeHeight(context) * 0.03,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.fromLTRB(
                  sizeWidth(context) * 0.04,
                  sizeHeight(context) * 0.02,
                  sizeWidth(context) * 0.04,
                  sizeWidth(context) * 0.015,
                ),
                child: Text(
                  "Overview",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontFamily: fontsSVNGilroyBold,
                        color: normalTextColor,
                      ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: sizeWidth(context) * 0.04,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: sizeWidth(context) * 0.04,
                  vertical: sizeHeight(context) * 0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Text(
                  "In 2022, a virtual reality massively multiplayer online role-playing game (VRMMORPG) called Sword Art Online (SAO) was released. With the NerveGear, a helmet that stimulates the user's five senses via their brain, players can experience and control their in-game characters with their minds. Both the game and the NerveGear were created by Akihiko Kayaba. On November 6, 10,000 players log into SAO's mainframe cyberspace for the first time, only to discover that they are unable to log out. Kayaba appears and tells the players that they must beat all 100 floors of Aincrad, a steel castle which is the setting of SAO, if they wish to be free. He also states that those who suffer in-game deaths or forcibly remove the NerveGear out-of-game will suffer real-life deaths.",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: fontsSVNGilroyRegular,
                        color: greyTextColor,
                        height: sizeHeight(context) * 0.0015,
                      ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: sizeHeight(context) * 0.2,
              ),
            ),
          ],
        ),
        const BottomOptionButton()
      ],
    );
  }
}


