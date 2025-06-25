import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class InteriorSlider extends StatefulWidget {
  const InteriorSlider({super.key});

  @override
  _InteriorSliderState createState() => _InteriorSliderState();
}

class _InteriorSliderState extends State<InteriorSlider> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 3;

  final List<Map<String, String>> _images = [
    {
      'url': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw3fdecc1d/reserves/VF8/interior-img1.webp',
      'alt': 'VinFast Interior Design',
    },
    {
      'url': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw908cf0f3/reserves/VF8/interior-img2.webp',
      'alt': 'VinFast Interior Design',
    },
    {
      'url': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwcbdcd23a/reserves/VF8/interior-img3.webp',
      'alt': 'VinFast Interior Design',
    },
    {
      'url': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw3adf82ae/reserves/VF8/interior-img4.webp',
      'alt': 'VinFast Interior Design',
    },
    {
      'url': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw14723304/reserves/VF8/interior-img5.webp',
      'alt': 'VinFast Interior Design',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            initialPage: _currentIndex,
            viewportFraction: 1.0,
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
                return Image.network(
                  image['url']!,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text('Lỗi tải ảnh'));
                  },
                );
              },
            );
          }).toList(),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _images.asMap().entries.map((entry) {
            int index = entry.key;
            String url = entry.value['url']!;
            return GestureDetector(
              onTap: () => _carouselController.animateToPage(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _currentIndex == index ? Colors.blue : Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Text('Lỗi'));
                    },
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}