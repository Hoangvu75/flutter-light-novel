import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_novel/bloc/bottomNavBar/bottom_nav_bar_bloc.dart';
import 'package:light_novel/bloc/bottomNavBar/bottom_nav_bar_event.dart';
import 'package:light_novel/bloc/bottomNavBar/bottom_nav_bar_state.dart';

import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.pageController,
    required this.bottomNavBarState,
  });

  final PageController pageController;
  final BottomNavBarState bottomNavBarState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeWidth(context),
      height: sizeHeight(context) * 0.06,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: SizedBox(
          width: sizeWidth(context) * 0.15,
          height: sizeWidth(context) * 0.15,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: primaryColor,
            onPressed: () {},
            child: const Icon(Icons.menu_book_sharp),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: sizeWidth(context) * 0.01,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              NavButton(
                pageController: pageController,
                bottomNavBarState: bottomNavBarState,
                position: 0,
                title: "Home",
                iconData: Icons.home,
              ),
              NavButton(
                pageController: pageController,
                bottomNavBarState: bottomNavBarState,
                position: 1,
                title: "Search",
                iconData: Icons.search,
              ),
              SizedBox(
                width: sizeWidth(context) * 0.12,
              ),
              NavButton(
                pageController: pageController,
                bottomNavBarState: bottomNavBarState,
                position: 2,
                title: "Favourite",
                iconData: Icons.favorite,
              ),
              NavButton(
                pageController: pageController,
                bottomNavBarState: bottomNavBarState,
                position: 3,
                title: "Account",
                iconData: Icons.account_circle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.pageController,
    required this.bottomNavBarState,
    required this.position,
    required this.title,
    required this.iconData,
  });

  final PageController pageController;
  final BottomNavBarState bottomNavBarState;
  final int position;
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeWidth(context) * 0.22,
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          pageController.animateToPage(
            position,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeIn,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: bottomNavBarState.position == position ? primaryColor : primaryColor.withOpacity(0.5),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontFamily: fontsSVNGilroyRegular,
                    color: bottomNavBarState.position == position ? primaryColor : primaryColor.withOpacity(0.5),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
