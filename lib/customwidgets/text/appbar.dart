import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/customwidgets/text/body.dart';

class CollapsibleHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const CollapsibleHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      pinned: true,
      backgroundColor: AppColors.orange,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double top = constraints.biggest.height;
          final bool isCollapsed =
              top < (MediaQuery.of(context).padding.top + kToolbarHeight + 10);

          log('isCollapsed: $isCollapsed');

          return FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
            title:
                isCollapsed
                    ? MainBody(
                      title: title,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontcolor: AppColors.white,
                    )
                    : null,
            background: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  MainBody(
                    title: title,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontcolor: AppColors.white,
                  ),
                  const SizedBox(height: 10),
                  MainBody(
                    title: subtitle,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    fontcolor: AppColors.white,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Menuheader extends StatelessWidget {
  final String title;

  const Menuheader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 110,
      floating: true,
      snap: true,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0, // Remove shadow
      surfaceTintColor: Colors.white, // Prevent theme overlay tint
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double top = constraints.biggest.height;
          final bool isCollapsed =
              top < (MediaQuery.of(context).padding.top + kToolbarHeight + 10);

          log('isCollapsed: $isCollapsed');

          return FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: const EdgeInsets.only(left: 0, bottom: 12),
            title:
                isCollapsed
                    ? MainBody(
                      title: title,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontcolor: AppColors.black,
                    )
                    : null,
            background: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainBody(
                  title: title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontcolor: AppColors.black,
                ),
                const SizedBox(height: 10),
                Container(
                  height: 53,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 54.0, top: 3),
                        child: Row(
                          children: [
                            Text(
                              'Search for ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            AnimatedTextKit(
                              repeatForever: true,
                              pause: const Duration(milliseconds: 400),
                              animatedTexts: [
                                FadeAnimatedText(
                                  'Dishes',
                                  textStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                  duration: Duration(milliseconds: 1200),
                                ),
                                FadeAnimatedText(
                                  'Biryani',
                                  textStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                  duration: Duration(milliseconds: 1200),
                                ),
                                FadeAnimatedText(
                                  'Paratha',
                                  textStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                  duration: Duration(milliseconds: 1200),
                                ),
                              ],
                              isRepeatingAnimation: true,
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            AppImages.searchiconthin,
                            scale: 2.2,
                          ),
                          border: InputBorder.none,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 13,
                          ),
                        ),
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
