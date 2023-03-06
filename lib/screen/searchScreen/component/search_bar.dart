import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_novel/bloc/search/search_bloc.dart';

import '../../../bloc/search/search_event.dart';
import '../../../generated/color.dart';
import '../../../generated/dimension.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          sizeWidth(context) * 0.04,
          0,
          sizeWidth(context) * 0.04,
          0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onSubmitted: (value) {
            context.read<SearchBloc>().add(OnSubmitSearchEvent());
          },
          controller: TextEditingController(),
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
