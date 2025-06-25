import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FieldSlider extends StatefulWidget {
  const FieldSlider({super.key});

  @override
  _FieldSliderState createState() => _FieldSliderState();
}

class _FieldSliderState extends State<FieldSlider> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 2;

  final List<Map<String, String>> _images = [
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw2370f045/reserves/VF8/giamsatht.webp',
      'alt': '',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw25e665ad/reserves/VF8/canhbaovc.webp',
      'alt': '',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwe66f6107/reserves/VF8/trolai.webp',
      'alt': '',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw49194a59/reserves/VF8/trolan.webp',
      'alt': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 2, color: Colors.grey.withOpacity(.1)),
        ),
      ),
      child: CarouselSlider(
        carouselController: _carouselController,
        options: CarouselOptions(
          height: 358,
          initialPage: _currentIndex,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: false,
          scrollDirection: Axis.vertical,
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
                fit: BoxFit.cover,
                width: double.infinity,
                height: 358,
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
    );
  }
}
