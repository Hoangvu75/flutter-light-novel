import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_novel/screen/favouriteScreen/component/favourite_ln_item_list.dart';

import '../../bloc/scrollController/scroll_controller_bloc.dart';
import '../../bloc/scrollController/scroll_controller_event.dart';
import '../../bloc/scrollController/scroll_controller_state.dart';
import '../../generated/color.dart';
import '../../generated/dimension.dart';
import '../../generated/fontFamily.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

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
            child: const FavouriteScreenBody(),
          ),
        ),
      ),
    );
  }
}

class FavouriteScreenBody extends StatefulWidget {
  const FavouriteScreenBody({Key? key}) : super(key: key);

  @override
  State<FavouriteScreenBody> createState() => _FavouriteScreenBodyState();
}

class _FavouriteScreenBodyState extends State<FavouriteScreenBody> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset > sizeHeight(context) * 0.075) {
        context.read<ScrollControllerBloc>().add(OnTopEvent());
      } else {
        context.read<ScrollControllerBloc>().add(OutTopEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        BlocBuilder<ScrollControllerBloc, ScrollControllerState>(builder: (context, scrollControllerState) {
          return SliverAppBar(
            leadingWidth: sizeWidth(context) * 0.15,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: sizeHeight(context) * 0.13,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: scrollControllerState.isOnTop ? Colors.white : Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  scrollControllerState.isOnTop ? null : EdgeInsets.only(left: 20 * responsiveSize.width),
              title: Text(
                "Your favourite novels",
                style: !scrollControllerState.isOnTop
                    ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontFamily: fontsSVNGilroySemiBold,
                          color: primaryColor,
                        )
                    : Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: fontsSVNGilroyBold,
                          color: primaryColor,
                        ),
              ),
              centerTitle: scrollControllerState.isOnTop ? true : false,
            ),
          );
        }),
        SliverToBoxAdapter(
          child: SizedBox(
            height: sizeHeight(context) * 0.03,
          ),
        ),
        const SliverToBoxAdapter(
          child: FavouriteLnItemList(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: sizeHeight(context) * 0.15,
          ),
        ),
      ],
    );
  }
}
