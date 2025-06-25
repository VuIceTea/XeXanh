import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Car360View extends StatefulWidget {
  const Car360View({super.key});

  @override
  _Car360ViewState createState() => _Car360ViewState();
}

class _Car360ViewState extends State<Car360View> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;
  String _currentColor = '1821'; 
  String _colorName = 'Rose Pink';

  final List<Map<String, String>> _colors = [
    {'id': '181U', 'name': 'Summer Yellow', 'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwf22e2e6c/reserves/VF3/icon/icon-4.png'},
    {'id': '1821', 'name': 'Rose Pink', 'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw4bd690fe/reserves/VF3/icon/icon-1.png'},
    {'id': 'CE1V', 'name': 'Zenith Grey', 'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw90015c16/reserves/VF3/icon/icon-2.png'},
    {'id': 'CE1M', 'name': 'Crimson Red', 'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw3dbfa02e/reserves/VF3/icon/icon-5.png'},
    {'id': '181Y', 'name': 'Sky Blue', 'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw10bdaab2/reserves/VF3/icon/icon-6.png'},
    {'id': 'CE1W', 'name': 'Urban Mint', 'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwc4c49c12/reserves/VF3/icon/icon-7.png'},
    {'id': 'CE18', 'name': 'Infinity Blanc', 'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw9cf7173e/reserves/VF3/icon/icon-8.png'},
  ];

  List<String> _getImageUrls(String colorId) {
    const baseUrl = 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/vi_VN/v1750122013136/ldp-all-cars/360/VF3/exterior/';
    return List.generate(36, (index) => '$baseUrl$colorId/F${index + 1}.png');
  }

  void _handleDrag(DragUpdateDetails details) {
    final double sensitivity = 0.01; 
    final double delta = -details.delta.dx * sensitivity; 
    final newIndex = (_currentIndex + delta).clamp(0, 35).toInt();
    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
        _carouselController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 50),
          curve: Curves.linear,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onHorizontalDragUpdate: _handleDrag,
          child: Stack(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 202.5,
                  viewportFraction: 1.0,
                  autoPlay: false,
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  scrollPhysics: const NeverScrollableScrollPhysics(), 
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: _getImageUrls(_currentColor).map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.network(
                        url,
                        fit: BoxFit.cover,
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
              Positioned(
                left: 0,
                top: 86.25,
                child: IconButton(
                  onPressed: () => _carouselController.previousPage(),
                  icon: const Icon(Icons.arrow_back_ios, size: 15, color: Colors.black87),
                ),
              ),
              Positioned(
                right: 0,
                top: 86.25,
                child: IconButton(
                  onPressed: () => _carouselController.nextPage(),
                  icon: const Icon(Icons.arrow_forward_ios, size: 15, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            _colorName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _colors.map((color) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentColor = color['id']!;
                    _colorName = color['name']!;
                    _currentIndex = 0;
                    _carouselController.animateToPage(0);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _currentColor == color['id'] ? Colors.blue : Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    color['icon']!,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}