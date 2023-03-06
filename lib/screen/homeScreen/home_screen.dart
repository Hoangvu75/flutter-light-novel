import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_novel/bloc/categorySelector/category_selector_bloc.dart';
import 'package:light_novel/bloc/categorySelector/category_selector_state.dart';
import 'package:light_novel/screen/homeScreen/component/menu_bar.dart';

import '../../generated/color.dart';
import '../../generated/dimension.dart';
import 'component/category_selector_bar.dart';
import 'component/header_text.dart';
import 'component/novel_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocProvider<CategorySelectorBloc>(
              create: (context) => CategorySelectorBloc(),
              child: BlocBuilder<CategorySelectorBloc, CategorySelectorState>(
                  builder: (context, categorySelectorState) {
                return Column(
                  children: [
                    const HomeMenuBar(),
                    SizedBox(
                      height: sizeHeight(context) * 0.02,
                    ),
                    const HeaderText(),
                    SizedBox(
                      height: sizeHeight(context) * 0.04,
                    ),
                    CategorySelectorBar(
                      categorySelectorState: categorySelectorState,
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.04,
                    ),
                    NovelList(
                      categorySelectorState: categorySelectorState,
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.15,
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}


