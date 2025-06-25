import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VF5ExteriorSlider extends StatefulWidget {
  const VF5ExteriorSlider({super.key});

  @override
  _VF5ExteriorSliderState createState() => _VF5ExteriorSliderState();
}

class _VF5ExteriorSliderState extends State<VF5ExteriorSlider> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 1; // Chỉ số mặc định (vf5-thumb-3 là active)

  // Danh sách hình ảnh ngoại thất
  final List<Map<String, String>> _images = [
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw9ec2d39a/reserves/VF5/vf5-thumb-2.webp',
      'alt': 'VinFast VF 5',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwbca07281/reserves/VF5/vf5-thumb-3.webp',
      'alt': 'VinFast VF 5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 120, // Giảm height nhỏ hơn nữa
                  initialPage: _currentIndex,
                  viewportFraction: 0.75, // Giảm xuống 70% để ảnh nhỏ hơn
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
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              35,
                            ), // Bo góc 40
                            child: AspectRatio(
                              aspectRatio:
                                  16 / 9, // Tỷ lệ 16:9 phù hợp với ảnh xe hơi
                              child: Image.network(
                                image['url']!,
                                fit: BoxFit
                                    .cover, // Cover nhưng với AspectRatio phù hợp
                                alignment: Alignment.center,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ),
                                        ),
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Lỗi tải ảnh',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
