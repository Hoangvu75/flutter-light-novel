import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_novel/bloc/scrollController/scroll_controller_bloc.dart';
import 'package:light_novel/bloc/search/search_bloc.dart';
import 'package:light_novel/bloc/search/search_state.dart';

import '../../bloc/scrollController/scroll_controller_event.dart';
import '../../bloc/scrollController/scroll_controller_state.dart';
import '../../generated/color.dart';
import '../../generated/dimension.dart';
import '../../generated/fontFamily.dart';
import 'component/search_bar.dart';
import 'component/search_ln_item_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => ScrollControllerBloc()),
                BlocProvider(create: (context) => SearchBloc()),
              ],
              child: const SearchScreenBody(),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({Key? key}) : super(key: key);

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
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
                "Search for novels",
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
        const SearchBar(),
        SliverToBoxAdapter(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, searchState) {
              return searchState.isSearched
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: sizeHeight(context) * 0.03,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: sizeWidth(context) * 0.04,
                          ),
                          child: Text(
                            "Result for Sword Art Online",
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontFamily: fontsSVNGilroySemiBold,
                                  color: primaryColor,
                                ),
                          ),
                        ),
                        const SearchLnItemList(),
                      ],
                    )
                  : Container();
            },
          ),
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
