import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../../bloc/categorySelector/category_selector_bloc.dart';
import '../../../bloc/categorySelector/category_selector_event.dart';
import '../../../bloc/categorySelector/category_selector_state.dart';
import '../../../generated/color.dart';
import '../../../generated/dimension.dart';
import '../../../generated/fontFamily.dart';

class CategorySelectorBar extends StatelessWidget {
  const CategorySelectorBar({
    super.key,
    required this.categorySelectorState,
  });

  final CategorySelectorState categorySelectorState;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategorySelector(
            title: 'All',
            position: 0,
            categorySelectorState: categorySelectorState,
          ),
          CategorySelector(
            title: 'Romance',
            position: 1,
            categorySelectorState: categorySelectorState,
          ),
          CategorySelector(
            title: 'Actions',
            position: 2,
            categorySelectorState: categorySelectorState,
          ),
          CategorySelector(
            title: 'Ecchi',
            position: 3,
            categorySelectorState: categorySelectorState,
          ),
          CategorySelector(
            title: 'Hentai',
            position: 4,
            categorySelectorState: categorySelectorState,
          ),
        ],
      ),
    );
  }
}

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    super.key,
    required this.title,
    required this.position,
    required this.categorySelectorState,
  });

  final String title;
  final int position;
  final CategorySelectorState categorySelectorState;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {
        context.read<CategorySelectorBloc>().add(ChangeCategorySelectorPosition(position: position));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: sizeWidth(context) * 0.04,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: sizeWidth(context) * 0.04,
                vertical: sizeWidth(context) * 0.015,
              ),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontFamily: categorySelectorState.position == position
                      ? fontsSVNGilroySemiBold
                      : fontsSVNGilroyRegular,
                  color: categorySelectorState.position == position ? primaryColor : greyTextColor,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: categorySelectorState.position == position ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              height: sizeHeight(context) * 0.005,
              width: sizeWidth(context) * 0.2,
            )
          ],
        ),
      ),
    );
  }
}