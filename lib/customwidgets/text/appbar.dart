import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:food_delivery/constants/colors.dart';
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
      expandedHeight: 110,
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
              padding: const EdgeInsets.only(
                top: 60,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainBody(
                    title: title,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontcolor: AppColors.white,
                  ),
                  const SizedBox(height: 10),
                  MainBody(
                    title: subtitle,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
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
  final String subtitle;

  const Menuheader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 80,
      pinned: true,
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
              padding: const EdgeInsets.only(
                top: 60,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainBody(
                    title: title,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontcolor: AppColors.white,
                  ),
                  const SizedBox(height: 10),
                  MainBody(
                    title: subtitle,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
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
