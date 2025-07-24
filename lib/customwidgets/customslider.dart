import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Custombanner extends StatelessWidget {
  const Custombanner({super.key, required this.banner});
  final List<String> banner;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        autoPlayAnimationDuration: const Duration(milliseconds: 2000),
        autoPlayInterval: const Duration(milliseconds: 6000),
        viewportFraction: 1,
        aspectRatio: 1.2,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
      items:
          banner.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(i),
                      // child: CachedNetworkImage(
                      //   imageUrl: imageurl,
                      //   color: null,
                      //   fit: BoxFit.cover,

                      //   errorWidget: (context, url, error) => const Icon(
                      //       Icons.error), // Error icon if image fails to load
                      // ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
    );
  }
}
