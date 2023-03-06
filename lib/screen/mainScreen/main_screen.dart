import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_novel/bloc/bottomNavBar/bottom_nav_bar_state.dart';

import '../../bloc/bottomNavBar/bottom_nav_bar_bloc.dart';
import '../../bloc/bottomNavBar/bottom_nav_bar_event.dart';
import '../accountScreen/account_screen.dart';
import '../favouriteScreen/favourite_screen.dart';
import '../homeScreen/home_screen.dart';
import '../searchScreen/search_screen.dart';
import 'component/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController(initialPage: 0, keepPage: true);

  final List<Widget> screenList = [
    const HomeScreen(),
    const SearchScreen(),
    const FavouriteScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavBarBloc>(
      create: (context) => BottomNavBarBloc(),
      child: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(builder: (context, bottomNavBarState) {
        return Stack(
          children: [
            Scaffold(
              body: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                itemCount: screenList.length,
                onPageChanged: (int page) {
                  context.read<BottomNavBarBloc>().add(ChangeBottomNavBarPosition(position: page));
                },
                itemBuilder: (BuildContext context, int index) {
                  return screenList[index];
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: BottomNavBar(
                pageController: pageController,
                bottomNavBarState: bottomNavBarState,
              ),
            ),
          ],
        );
      }),
    );
  }
}
