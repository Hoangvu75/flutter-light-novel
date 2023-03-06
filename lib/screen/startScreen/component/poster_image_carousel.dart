import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_novel/generated/color.dart';
import 'package:light_novel/generated/dimension.dart';

import '../../../bloc/indicator/indicator_bloc.dart';
import '../../../bloc/indicator/indicator_event.dart';
import '../../../bloc/indicator/indicator_state.dart';

class PosterImageCarousel extends StatelessWidget {
  PosterImageCarousel({super.key, required this.posterImage});

  final List<String> posterImage;
  final PageController pageController = PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage < posterImage.length) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });

    return BlocProvider(
      create: (context) => IndicatorBloc(),
      child: BlocBuilder<IndicatorBloc, IndicatorState>(builder: (context, indicatorState) {
        return Column(
          children: [
            SizedBox(
              height: sizeHeight(context) * 0.42,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                itemCount: posterImage.length,
                onPageChanged: (int page) {
                  context.read<IndicatorBloc>().add(ChangeIndicatorPosition(position: page));
                },
                itemBuilder: (BuildContext context, int index) {
                  return CarouselPage(
                    pageController: pageController,
                    index: index,
                    posterImage: posterImage[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: sizeHeight(context) * 0.03,
            ),
            IndicatorList(
              pageController: pageController,
              indicatorState: indicatorState,
            ),
          ],
        );
      }),
    );
  }
}

class CarouselPage extends StatelessWidget {
  const CarouselPage({
    super.key,
    required this.index,
    required this.pageController,
    required this.posterImage,
  });

  final String posterImage;
  final PageController pageController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        pageController.jumpTo(pageController.offset - details.delta.dx * 1.5);
      },
      child: Column(
        children: [
          Container(
            height: sizeHeight(context) * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 4.0,
                  spreadRadius: 4.0,
                  offset: const Offset(4, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                posterImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IndicatorList extends StatelessWidget {
  const IndicatorList({
    super.key,
    required this.indicatorState,
    required this.pageController,
  });

  final PageController pageController;
  final IndicatorState indicatorState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleIndicator(
            position: 0,
            indicatorState: indicatorState,
            pageController: pageController,
          ),
          SizedBox(
            width: sizeWidth(context) * 0.02,
          ),
          SingleIndicator(
            position: 1,
            indicatorState: indicatorState,
            pageController: pageController,
          ),
          SizedBox(
            width: sizeWidth(context) * 0.02,
          ),
          SingleIndicator(
            position: 2,
            indicatorState: indicatorState,
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}

class SingleIndicator extends StatelessWidget {
  const SingleIndicator({
    super.key,
    required this.position,
    required this.indicatorState,
    required this.pageController,
  });

  final int position;
  final IndicatorState indicatorState;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pageController.animateToPage(
          position,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: sizeHeight(context) * 0.01,
        width: indicatorState.position == position ? sizeWidth(context) * 0.1 : sizeWidth(context) * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            indicatorState.position == position
                ? BoxShadow(
              color: softPrimaryColor.withOpacity(0.72),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(
                0.0,
                0.0,
              ),
            )
                : const BoxShadow(
              color: Colors.transparent,
            )
          ],
          color: indicatorState.position == position ? primaryColor : softPrimaryColor,
        ),
      ),
    );
  }
}
