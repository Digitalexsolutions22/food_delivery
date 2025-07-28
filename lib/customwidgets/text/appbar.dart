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
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search For dishes',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 18,
                      ),
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
