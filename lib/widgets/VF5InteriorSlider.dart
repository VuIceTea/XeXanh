import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VF5InteriorSlider extends StatefulWidget {
  const VF5InteriorSlider({super.key});

  @override
  State<VF5InteriorSlider> createState() => _VF5InteriorSliderState();
}

class _VF5InteriorSliderState extends State<VF5InteriorSlider> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  final List<Map<String, String>> _images = [
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw37c1303c/reserves/VF5/int-color-1.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwd366b1c8/reserves/VF5/int-color-2.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw3aaaec90/reserves/VF5/int-color-3.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwc8a0c1b4/reserves/VF5/int-color-4.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwe6969330/reserves/VF5/int-color-5.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwbf740e83/reserves/VF5/int-color-6.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwf4aeff72/reserves/VF5/int-color-7.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw1b2f9f01/reserves/VF5/int-color-8.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw2f85b4a5/reserves/VF5/int-color-9.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw45ea48a2/reserves/VF5/int-color-10.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwcf412e42/reserves/VF5/int-color-11.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwa74d9eeb/reserves/VF5/int-color-12.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw7ce7b2b2/reserves/VF5/int-color-13.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwc4822110/reserves/VF5/int-color-14.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw78dda819/reserves/VF5/int-color-15.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw2083ba17/reserves/VF5/int-color-16.webp',
      'alt': 'VinFast VF 5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          width: double.infinity,
          height: 550,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 30,
          left: 20,
          child: SvgPicture.asset(
            "assets/images/logoVF5.svg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60,
          left: 20,
          child: Text(
            'Nội thất tinh tế',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          top: 110,
          left: 20,
          right: 20,
          child: SizedBox(
            child: Text(
              'Không gian rộng rãi, phối màu sành điệu, cuốn hút với các đường viền bắt mắt.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 180,
          left: 0,
          right: 0,
          child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 200,
              initialPage: _currentIndex,
              viewportFraction: 0.65,
              enlargeCenterPage: false,
              autoPlay: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: _images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    width: 300,
                    child: Image.network(
                      image['url']!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Text('Lỗi tải ảnh'));
                      },
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Positioned(
          top: 400,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _images.asMap().entries.map((entry) {
              int index = entry.key;
              return GestureDetector(
                onTap: () => _carouselController.animateToPage(index),
                child: Container(
                  width: 18,
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: _currentIndex == index
                        ? Colors.blue
                        : const Color.fromARGB(255, 214, 212, 212),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 20,
          child: Text(
            'Ngoại thất ấn tượng',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          bottom: 25,
          left: 20,
          child: Text(
            'Phong cách trẻ trung, năng động, cá tính',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
