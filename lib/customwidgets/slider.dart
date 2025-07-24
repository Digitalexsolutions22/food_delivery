import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_delivery/customwidgets/text/body.dart';

class BannerCarouselSlider extends StatelessWidget {
  final List<Map<String, String>> bannerList;
  const BannerCarouselSlider({super.key, required this.bannerList});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return CarouselSlider(
      options: CarouselOptions(
        height: isMobile ? 200 : 400,
        viewportFraction: 0.9,
        enlargeCenterPage: true,
        autoPlay: true,

        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 1500),
      ),
      items:
          bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          banner["image"]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 20,
                        child: SizedBox(
                          width: isMobile ? 250 : 400,
                          child: MainBody(
                            textAlign: TextAlign.center,
                            fonthigth: 1,
                            title: banner["title"]!,
                            fontcolor: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 18 : 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
    );
  }
}
