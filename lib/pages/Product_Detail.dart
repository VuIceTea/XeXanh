import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selling_car/widgets/Car360View.dart';
import 'package:selling_car/widgets/Charging_Station.dart';
import 'package:selling_car/widgets/ColorTabView.dart';
import 'package:selling_car/widgets/FieldSlider.dart';
import 'package:selling_car/widgets/Footer.dart';
import 'package:selling_car/widgets/Header.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:selling_car/widgets/InteriorSlider.dart';
import 'package:selling_car/widgets/Register_For_Consultation.dart';
import 'package:selling_car/widgets/VF5ExteriorSliderState.dart';
import 'package:selling_car/widgets/VF5InteriorSlider.dart';
import 'package:selling_car/widgets/VF7/VF7Widget.dart';
import 'package:video_player/video_player.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  final CarouselSliderController carouselControllerASUV =
      CarouselSliderController();
  final CarouselSliderController carouselControllerASUV1 =
      CarouselSliderController();
  final CarouselSliderController carouselControllerASUV2 =
      CarouselSliderController();
  final CarouselSliderController carouselControllerASUV3 =
      CarouselSliderController();
  int _currentIndex = 0;
  int _currentIndexColorType = 0;
  int _currentIndex2 = 0;
  int _currentIndex3 = 0;
  int _currentIndex4 = 0;
  int selectedModelIndex = 0;

  final List<Map<String, String>> _images = [
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw517acfba/reserves/VF6/exterior-vf6-1.webp',
      'alt': 'VinFast VF 6',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwb1801660/reserves/VF6/exterior-vf6-2.webp',
      'alt': 'VinFast VF 6',
    },
  ];

  final List<Map<String, String>> _images2 = [
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw3cec264f/reserves/VF6/interior-vf6-1.jpg',
      'alt': 'VinFast VF 6',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw5e97d502/reserves/VF6/interior-vf6-2.jpg',
      'alt': 'VinFast VF 6',
    },
  ];

  final List<Map<String, String>> _images3 = [
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw85404d6b/reserves/VF6/technology-vf6-3.jpg',
      'alt': 'VinFast VF 6',
    },
    {
      'url':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwff8bee22/reserves/VF6/technology-vf6-4.jpg',
      'alt': 'VinFast VF 6',
    },
  ];

  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex5 = 0;

  final List<String> _images4 = [
    'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw645188ef/reserves/VF6/VF6-Lifestyle-01.jpg',
    'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw728cff84/reserves/VF6/VF6-Lifestyle-02.jpg',
    'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwa7b70283/reserves/VF6/VF6-Lifestyle-03.jpg',
    'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwc530fef9/reserves/VF6/VF6-Lifestyle-04.jpg',
    'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw1135ee4f/reserves/VF6/VF6-Lifestyle-05.jpg',
    'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwe7e90ba1/reserves/VF6/VF6-Lifestyle-06.jpg',
  ];

  late FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(
        "https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw3bedfd7b/reserves/VF3/TVC_VF3_Online_1080.mp4",
      ),
    ),
  );

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.product['type'] == 'C-SUV'
          ? const Color.fromARGB(255, 22, 19, 18)
          : Colors.grey[100],
      body: Column(
        children: [
          Header(),
          Expanded(
            child: SingleChildScrollView(
              padding: widget.product['type'] == 'C-SUV'
                  ? EdgeInsets.all(0)
                  : const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSimilarPhotosCarousel(
                    widget.product['similar_photos'] as List<String>?,
                  ),
                  widget.product['type'] == 'C-SUV'
                      ? SizedBox()
                      : SizedBox(height: 30),
                  if (widget.product['type'] == 'C-SUV')
                    SizedBox()
                  else
                    Center(
                      child: Text(
                        widget.product['name'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  widget.product['type'] == 'C-SUV'
                      ? SizedBox()
                      : const SizedBox(height: 20),
                  if (widget.product['type'] != 'C-SUV' &&
                      widget.product['model'] != null &&
                      widget.product['model'] is List)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chọn phiên bản:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children: List.generate(
                            widget.product['model'].length,
                            (index) {
                              final isSelected = index == selectedModelIndex;
                              return ChoiceChip(
                                label: Text(widget.product['model'][index]),
                                selected: isSelected,
                                onSelected: (_) {
                                  setState(() {
                                    selectedModelIndex = index;
                                  });
                                },
                                selectedColor: Colors.blue,
                                labelStyle: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                checkmarkColor: Colors.white,
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                  widget.product['type'] == 'C-SUV'
                      ? SizedBox()
                      : const SizedBox(height: 20),

                  if (widget.product['type'] == 'C-SUV')
                    SizedBox()
                  else
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(text: 'Loại xe: '),
                          TextSpan(text: '${widget.product['type']}'),
                        ],
                      ),
                    ),

                  widget.product['type'] == 'C-SUV'
                      ? SizedBox()
                      : SizedBox(height: 20),

                  if (widget.product['type'] != 'C-SUV')
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(132, 163, 182, 1),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Giá bán',
                            style: TextStyle(
                              color: Color.fromRGBO(60, 60, 60, 1),
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            widget.product['price'] is List
                                ? widget.product['price'][selectedModelIndex]
                                : widget.product['price'] ?? 'N/A',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  widget.product['type'] == 'C-SUV'
                      ? SizedBox()
                      : const SizedBox(height: 25),
                  if (widget.product['type'] == 'C-SUV')
                    SizedBox()
                  else
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Color.fromRGBO(20, 100, 244, 1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(0),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Liên hệ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  widget.product['type'] == 'C-SUV'
                      ? SizedBox()
                      : const SizedBox(height: 64),
                  _renderProductDetail(),
                  SizedBox(height: 10),
                  ChargingStation(),
                  SizedBox(height: 50),
                  ...[
                    if (widget.product['type'] == 'Mini Car')
                      _renderSpecifications(),
                  ],
                  SizedBox(height: 50),
                  RegisterForConsultation(),
                  SizedBox(height: 50),
                  Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarPhotosCarousel(List<String>? photos) {
    if (photos == null || photos.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 36),
        Stack(
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                autoPlay: true,
              ),
              items: photos.map((path) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(path, fit: BoxFit.contain),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              left: 0,
              top: 130,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    carouselController.previousPage();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130,
              right: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    carouselController.nextPage();
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: photos.asMap().entries.map((entry) {
                int index = entry.key;
                String path = entry.value;
                return GestureDetector(
                  onTap: () {
                    carouselController.animateToPage(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _currentIndex == index
                            ? Colors.blue
                            : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(path, fit: BoxFit.contain),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderIntroduction(
    String? introduction, [
    double fontSize = 26,
    Color? color,
  ]) {
    return introduction == null
        ? SizedBox()
        : Text(
            introduction,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: color ?? Colors.black,
            ),
          );
  }

  Widget _renderSectionTitle(String? sectionTitle, {double fontSize = 22}) {
    return sectionTitle == null
        ? SizedBox()
        : Text(
            sectionTitle,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          );
  }

  Widget _renderSubtitle(String? subTitle, {double fontSize = 16}) {
    return subTitle == null
        ? SizedBox()
        : Text(
            subTitle,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: fontSize,
              color: Color.fromRGBO(60, 60, 60, 1),
            ),
          );
  }

  Widget _renderImageDetail(String? path) {
    return path == null
        ? SizedBox()
        : Image.asset(path, width: double.infinity, fit: BoxFit.cover);
  }

  Widget _renderProductDetail() {
    final type = widget.product['type'];

    switch (type) {
      case 'Mini Car':
        return _renderMiniCarDetail();
      case 'SUV D':
        return _renderSuvDDetail();
      case 'SUV C':
        return _renderSuvCDetail();
      case 'A-SUV':
        return _renderSuvADetail();
      case 'B-SUV':
        return _renderSuvBDetail();
      case 'C-SUV':
        return _renderCUVDetail();
      default:
        return SizedBox();
    }
  }

  Widget _renderMiniCarDetail() {
    final product = widget.product;
    final List<String> introductions = List<String>.from(
      product['introductions'] ?? [],
    );
    final List<String> subtitles = List<String>.from(
      product['sub_titles'] ?? [],
    );
    final List<String> sectionTitles = List<String>.from(
      product['section_titles'] ?? [],
    );
    final List<String> imageDetails = List<String>.from(
      product['product_image_details'] ?? [],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (introductions.isNotEmpty) _renderIntroduction(introductions[0]),
        const SizedBox(height: 30),

        if (subtitles.isNotEmpty) _renderSubtitle(subtitles[0]),
        const SizedBox(height: 30),

        FlickVideoPlayer(flickManager: flickManager),
        const SizedBox(height: 30),

        if (introductions.length > 1) _renderIntroduction(introductions[1]),
        const SizedBox(height: 30),

        if (subtitles.length > 1) _renderSubtitle(subtitles[1]),
        const SizedBox(height: 30),

        Car360View(),
        const SizedBox(height: 30),

        if (sectionTitles.isNotEmpty) _renderSectionTitle(sectionTitles[0]),
        const SizedBox(height: 30),

        if (subtitles.length > 2) _renderSubtitle(subtitles[2]),
        const SizedBox(height: 30),

        if (imageDetails.isNotEmpty) _renderImageDetail(imageDetails[0]),
        const SizedBox(height: 30),

        if (sectionTitles.length > 1) _renderSectionTitle(sectionTitles[1]),
        const SizedBox(height: 30),

        if (subtitles.length > 3) _renderSubtitle(subtitles[3]),
        const SizedBox(height: 30),

        if (imageDetails.length > 1) _renderImageDetail(imageDetails[1]),
        const SizedBox(height: 30),

        if (sectionTitles.length > 2) _renderSectionTitle(sectionTitles[2]),
        const SizedBox(height: 30),

        if (subtitles.length > 4) _renderSubtitle(subtitles[4]),
        const SizedBox(height: 30),

        if (imageDetails.length > 2) _renderImageDetail(imageDetails[2]),
        const SizedBox(height: 30),

        if (introductions.length > 2) _renderIntroduction(introductions[2]),
        const SizedBox(height: 30),

        if (subtitles.length > 5) _renderSubtitle(subtitles[5]),
        const SizedBox(height: 30),

        if (imageDetails.length > 3) _renderImageDetail(imageDetails[3]),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _renderSuvDDetail() {
    final product = widget.product;
    final List<String> introductions = List<String>.from(
      product['introductions'] ?? [],
    );
    final List<String> subtitles = List<String>.from(
      product['sub_titles'] ?? [],
    );
    final List<String> sectionTitles = List<String>.from(
      product['section_titles'] ?? [],
    );
    final List<String> imageDetails = List<String>.from(
      product['product_image_details'] ?? [],
    );
    final List<String> distances = List<String>.from(product['distance'] ?? []);
    final List<String> time = List<String>.from(product['time'] ?? []);
    final List<String> verhicleCapacitys = List<String>.from(
      product['vehicle_capacity'] ?? [],
    );
    final List<String> chargingTimes = List<String>.from(
      product['charging_time'] ?? [],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (introductions.isNotEmpty)
          Center(child: _renderIntroduction(introductions[0])),
        SizedBox(height: 25),
        if (widget.product['model'] != null &&
            widget.product['model'] is List &&
            widget.product['price'] is List &&
            widget.product['version'] is List)
          Column(
            children: List.generate(widget.product['model'].length, (index) {
              final modelName = widget.product['model'][index];
              final modelPrice = widget.product['price'][index];
              final modelImage = widget.product['version'].length > index
                  ? widget.product['version'][index]
                  : 'assets/images/vf8-slider.png';

              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          modelName,
                          style: TextStyle(
                            color: Color.fromRGBO(20, 100, 244, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Image.asset(modelImage, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Giá xe:', style: TextStyle(fontSize: 15)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          modelPrice,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Color.fromRGBO(
                                      20,
                                      100,
                                      244,
                                      1,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'ĐẶT CỌC',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(20, 100, 244, 1),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'ĐĂNG KÝ LÁI THỬ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(20, 100, 244, 1),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          )
        else
          const SizedBox(),
        SizedBox(height: 20),
        Center(child: _renderIntroduction(introductions[1])),
        SizedBox(height: 20),
        _renderSubtitle(subtitles[0]),
        SizedBox(height: 20),
        ColorTabView(),
        SizedBox(height: 20),
        _buildFeatureTile(
          title: sectionTitles[0],
          imagePath: imageDetails[0],
          subtitle: subtitles[1],
        ),
        _buildFeatureTile(
          title: sectionTitles[1],
          imagePath: imageDetails[1],
          subtitle: subtitles[2],
        ),
        _buildFeatureTile(
          title: sectionTitles[2],
          imagePath: imageDetails[2],
          subtitle: subtitles[3],
        ),
        _buildFeatureTile(
          title: sectionTitles[3],
          imagePath: imageDetails[3],
          subtitle: subtitles[4],
        ),
        SizedBox(height: 60),
        Center(child: _renderIntroduction(introductions[2])),
        SizedBox(height: 20),
        _renderSubtitle(subtitles[5]),
        SizedBox(height: 20),
        InteriorSlider(),
        SizedBox(height: 20),
        _buildFeatureTile(
          title: sectionTitles[4],
          imagePath: imageDetails[4],
          subtitle: subtitles[6],
        ),
        _buildFeatureTile(
          title: sectionTitles[5],
          imagePath: imageDetails[5],
          subtitle: subtitles[7],
        ),
        _buildFeatureTile(
          title: sectionTitles[6],
          imagePath: imageDetails[6],
          subtitle: subtitles[8],
        ),
        _buildFeatureTile(
          title: sectionTitles[7],
          imagePath: imageDetails[7],
          subtitle: subtitles[9],
        ),
        SizedBox(height: 50),
        Center(child: _renderIntroduction(introductions[3])),
        SizedBox(height: 15),
        _renderSubtitle(subtitles[10]),
        SizedBox(height: 40),
        _renderImageDetail(imageDetails[8]),
        SizedBox(height: 25),
        _renderSubtitle(subtitles[11]),
        SizedBox(height: 15),
        _renderSubtitle(subtitles[12]),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
        ),
        SizedBox(height: 25),
        _renderImageDetail(imageDetails[9]),
        SizedBox(height: 25),
        _renderSubtitle(subtitles[13]),
        SizedBox(height: 15),
        _renderSubtitle(subtitles[14]),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
        ),
        SizedBox(height: 25),
        _renderImageDetail(imageDetails[10]),
        SizedBox(height: 20),
        _renderSubtitle(subtitles[15]),
        SizedBox(height: 15),
        _renderSubtitle(subtitles[16]),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 95),
          child: Center(child: _renderIntroduction(introductions[4])),
        ),
        SizedBox(height: 15),
        _renderSubtitle(subtitles[17]),
        SizedBox(height: 15),
        _renderImageDetail(imageDetails[11]),
        SizedBox(height: 30),
        _renderInfoSUVCar(text1: distances[0], text2: distances[1]),
        SizedBox(height: 20),
        _renderInfoSUVCar(text1: time[0], text2: time[1]),
        SizedBox(height: 20),
        _renderInfoSUVCar(
          text1: verhicleCapacitys[0],
          text2: verhicleCapacitys[1],
        ),
        SizedBox(height: 20),
        _renderInfoSUVCar(text1: chargingTimes[0], text2: chargingTimes[1]),
        SizedBox(height: 50),
        Center(child: _renderIntroduction(introductions[5])),
        SizedBox(height: 20),
        _renderSubtitle(subtitles[18]),
        SizedBox(height: 25),
        _renderImageDetail(imageDetails[12]),
        SizedBox(height: 15),
        _renderSectionTitle(sectionTitles[8]),
        SizedBox(height: 10),
        _renderSubtitle(subtitles[19]),
        SizedBox(height: 20),
        _renderImageDetail(imageDetails[13]),
        SizedBox(height: 20),
        _renderSectionTitle(sectionTitles[9]),
        SizedBox(height: 10),
        _renderSubtitle(subtitles[20]),
        SizedBox(height: 20),
        FieldSlider(),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_renderIntroduction(introductions[6])],
        ),
        SizedBox(height: 15),
        _renderSubtitle(subtitles[21]),
        SizedBox(height: 50),
      ],
    );
  }

  Widget _renderSuvCDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.product['carline'], fit: BoxFit.cover, width: 250),
        SizedBox(height: 40),
        _renderInfoSUVCCar(
          text1: 'Dài x rộng x cao (mm)',
          text2: widget.product['dimensions'],
        ),
        _renderInfoSUVCCar(
          text1: 'Chiều dài cơ sở',
          text2: widget.product['wheelbase'],
        ),
        _renderInfoSUVCCar(
          text1: 'Khoảng sáng gầm xe',
          text2: widget.product['ground_clearance'],
        ),
        _renderInfoSUVCCar(
          text1: 'Công suất tối đa',
          text2: widget.product['max_power'],
        ),
        _renderInfoSUVCCar(
          text1: 'Mô men xoắn cực đại',
          text2: widget.product['max_torque'],
        ),
        _renderInfoSUVCCar(
          text1: 'Quảng đường chạy (NEDC)',
          text2: widget.product['range_nedc'],
        ),
        _renderInfoSUVCCar(
          text1: 'Dung lượng pin khả dụng',
          text2: widget.product['usable_battery'],
        ),
        _renderInfoSUVCCar(
          text1: 'Công suất sạc nhanh DC tối đa',
          text2: widget.product['max_dc_charge'],
        ),
        _renderInfoSUVCCar(
          text1: 'Thời gian nạp pin',
          text2: widget.product['charge_time'],
        ),
        _renderInfoSUVCCar(
          text1: 'Dẫn động',
          text2: widget.product['drivetrain'],
        ),
        _renderInfoSUVCCar(
          text1: 'Chế độ lái',
          text2: widget.product['drive_modes'],
        ),
        _renderInfoSUVCCar(
          text1: 'Hệ thống treo (trước/sau)',
          text2: widget.product['suspension'],
        ),
        _renderInfoSUVCCar(
          text1: 'Hệ thống phanh (trước/sau)',
          text2: widget.product['brakes'],
        ),
        _renderInfoSUVCCar(
          text1: 'Kích thước la-zăng',
          text2: widget.product['wheel_size'],
        ),
        _renderInfoSUVCCar(
          text1: 'Đèn chiếu sáng phía trước',
          text2: widget.product['headlights'],
        ),
        _renderInfoSUVCCar(
          text1: 'Đóng/mở cốp sau',
          text2: widget.product['trunk_operation'],
        ),
        _renderInfoSUVCCar(
          text1: 'Hệ thống điều hòa',
          text2: widget.product['air_conditioning'],
        ),
        _renderInfoSUVCCar(
          text1: 'Màn hình giải trí cảm ứng',
          text2: widget.product['touchscreen'],
        ),
        _renderInfoSUVCCar(
          text1: 'Hệ thống loa',
          text2: widget.product['audio_system'],
        ),
        _renderInfoSUVCCar(
          text1: 'Ghế lái',
          text2: widget.product['driver_seat'],
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(border: Border()),
          child: FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: Color.fromRGBO(20, 100, 244, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: Text(
              'ĐẶT CỌC',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _renderSuvADetail() {
    final product = widget.product;
    final List<String> subtitles = List<String>.from(
      product['sub_titles'] ?? [],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderImageDetail('assets/images/vf5-hero-sp.webp'),
        _renderImageASUVCar(
          photos: List<String>.from([
            'assets/images/vf5-color-yellow.webp',
            'assets/images/vf5-color-green.webp',
            'assets/images/vf5-color-blue.webp',
            'assets/images/vf5-color-grey.webp',
          ]),
          colorType: List<String>.from([
            'VF 5 - SUMMER YELLOW',
            'VF 5 - URBAN MINT',
            'VF 5 - SKY BLUE',
            'VF 5 - ZENITH GREY',
          ]),
          title: List<String>.from([
            'Tự Teen Dẫn Lối Tự Do',
            'Phiêu nhịp sống xanh',
            'Chuyển động đa Z năng',
            'Toàn tâm công tác',
          ]),
          subTitle: List<String>.from([
            'Chọn khai mở cung đường mới thay vì lối mòn rập khuôn, năng lượng từ Summer Yellow giúp Kaity tự tin vào chất trẻ trung trong mình - để tinh thần tự do phóng khoáng luôn vượt lên những rào cản không tên. Giới hạn sẽ không bao giờ nằm trong từ điển cuộc sống, một khi có sắc vàng của VinFast 5 dẫn lối.',
            'Hiện đại với sắc xanh tươi mát, sống động và thân thiện với môi trường. Màu xanh mint mang đến cho Hà cảm giác tươi mới, đầy năng lượng, giúp Hà tận hưởng nhịp sống đô thị một cách trọn vẹn và đầy cảm hứng.',
            'Hơn cả một màu sắc, Sky Blue đối với Amee đại diện cho cá tính đậm nét Gen Z, chất “đa-zi-năng” và phong cách trẻ trung năng động. Mọi chuyển động cùng sắc xanh  Sky Blue chính là tuyên ngôn cho thần thái khác biệt của hội Gen Z.',
            'Lựa chọn sắc xám chính là lựa chọn thành công - toàn tâm toàn ý cho mọi “công task” trên hành trình sự nghiệp. Là biểu tượng của sự uy tín và mạnh mẽ, GreyD tin rằng Zenith Grey sẽ mang đến thần thái chuyên nghiệp, đẳng cấp và tự tin trên mọi con đường bạn lựa chọn.',
          ]),
        ),
        SizedBox(height: 10),
        VF5InteriorSlider(),
        SizedBox(height: 20),
        VF5ExteriorSlider(),
        SizedBox(height: 20),
        _renderSection(),
        SizedBox(height: 40),
        Center(
          child: SvgPicture.asset(
            "assets/images/logoVF5.svg",
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
        ),
        SizedBox(height: 30),
        _renderASUVSpecifications(
          title1: 'Dài x rộng x Cao (mm)',
          content1: widget.product['dimensions'],
          title2: 'Số ghế ngồi',
          content2: widget.product['total_seat'],
        ),
        SizedBox(height: 30),
        _renderASUVSpecifications(
          title1: 'Dung lượng pin khả dụng',
          content1: widget.product['usable_battery'],
          title2: 'Thời gian nạp pin nhanh nhất (10%-70%)',
          content2: widget.product['charge_time'],
        ),
        SizedBox(height: 30),
        _renderASUVSpecifications(
          title1: 'Loại la-zăng',
          content1: widget.product['wheel_size'],
          title2: 'Túi khí',
          content2: widget.product['number_airbag'],
        ),
        SizedBox(height: 30),
        _renderASUVSpecifications(
          title1: 'Mức tiêu thụ nhiên liệu công khai',
          content1: widget.product['fuel_consumption'],
          title2: '',
          content2: '',
        ),
        SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
        ),
        SizedBox(height: 30),
        if (subtitles.isNotEmpty)
          _renderDescriptionSuvADetail(content: subtitles[0]),
        SizedBox(height: 10),
        if (subtitles.length > 1)
          _renderDescriptionSuvADetail(content: subtitles[1]),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 5,
              height: 5,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            if (subtitles.length > 2)
              _renderDescriptionSuvADetail(content: subtitles[2]),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Container(
              width: 5,
              height: 5,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            if (subtitles.length > 3)
              _renderDescriptionSuvADetail(content: subtitles[3]),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Container(
              width: 5,
              height: 5,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            if (subtitles.length > 4)
              _renderDescriptionSuvADetail(content: subtitles[4]),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Container(
              width: 5,
              height: 5,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            if (subtitles.length > 5)
              _renderDescriptionSuvADetail(content: subtitles[5]),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Container(
              width: 5,
              height: 5,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            if (subtitles.length > 6)
              _renderDescriptionSuvADetail(content: subtitles[6]),
          ],
        ),
        SizedBox(height: 10),
        if (subtitles.length > 7)
          _renderDescriptionSuvADetail(content: subtitles[7]),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 5,
              height: 5,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            if (subtitles.length > 8)
              _renderDescriptionSuvADetail(content: subtitles[8]),
          ],
        ),
        SizedBox(height: 10),
        if (subtitles.length > 9)
          _renderDescriptionSuvADetail(content: subtitles[9]),
        SizedBox(height: 30),
        Center(
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Color.fromRGBO(20, 100, 244, 1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(0),
              ),
              minimumSize: Size(170, 45),
            ),
            onPressed: () {},
            child: Text(
              'NHẬN TƯ VẤN',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ),
        SizedBox(height: 50),
        Center(
          child: Text(
            'giá bán vf5'.toUpperCase(),
            style: TextStyle(
              color: Color.fromRGBO(20, 100, 244, 1),
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(20, 100, 244, 1),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            product['price'],
            style: TextStyle(
              color: Color.fromRGBO(20, 100, 244, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 70),
        Center(
          child: SizedBox(
            width: 200,
            child: Text(
              textAlign: TextAlign.center,
              'bảo hành bảo dưỡng'.toUpperCase(),
              style: TextStyle(
                color: Color.fromRGBO(20, 100, 244, 1),
                fontSize: 30,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(20, 100, 244, 1)),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(20, 100, 244, 1),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      'chính sách bảo hành'.toUpperCase(),
                      style: TextStyle(
                        color: Color.fromRGBO(20, 100, 244, 1),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Bảo hành xe mới: 7 năm/ 160.000 km. Pin cao áp (Mua lần đầu theo xe mới): 8 năm/ không giới hạn số km.',
                      style: TextStyle(
                        color: Color.fromRGBO(20, 100, 244, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }

  Color _getColorFromFileName(String fileName) {
    if (fileName.contains('yellow')) {
      return Color.fromRGBO(255, 209, 0, 1);
    } else if (fileName.contains('green')) {
      return Color.fromRGBO(173, 177, 152, 1);
    } else if (fileName.contains('blue')) {
      return Color.fromRGBO(0, 224, 255, 1);
    } else if (fileName.contains('grey')) {
      return Color.fromRGBO(199, 199, 199, 1);
    }
    return Color.fromRGBO(255, 209, 0, 1);
  }

  Widget _renderImageASUVCar({
    required List<String> photos,
    required List<String> colorType,
    required List<String> title,
    required List<String> subTitle,
  }) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: carouselControllerASUV,
          options: CarouselOptions(
            aspectRatio: 9 / 16,
            viewportFraction: 1,
            autoPlay: true,
            enlargeCenterPage: false,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndexColorType = index;
              });
            },
            initialPage: _currentIndexColorType,
          ),
          items: photos.asMap().entries.map((entry) {
            int index = entry.key;
            String photo = entry.value;

            return Stack(
              children: [
                Image.asset(photo, width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  top: 80,
                  left: 20,
                  right: 20,
                  child: Text(
                    colorType[index],
                    textAlign: index == 2 ? TextAlign.end : TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 20,
                  right: 20,
                  child: Text(
                    title[index],
                    textAlign: index == 2 ? TextAlign.end : TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 27,
                    ),
                  ),
                ),
                Positioned(
                  top: 170,
                  left: 20,
                  right: 20,
                  child: SizedBox(
                    child: Text(
                      subTitle[index],
                      textAlign: index == 2 ? TextAlign.end : TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: photos.asMap().entries.map((entry) {
                int index = entry.key;
                String fileName = entry.value;

                return GestureDetector(
                  onTap: () => carouselControllerASUV.animateToPage(entry.key),
                  child: Container(
                    width: 60,
                    height: _currentIndexColorType == entry.key ? 20 : 10,
                    decoration: BoxDecoration(
                      color: _getColorFromFileName(fileName),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderInfoSUVCCar({required String text1, required String text2}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1, style: TextStyle(color: Colors.grey, fontSize: 13)),
        SizedBox(height: 15),
        Text(text2, style: TextStyle(fontSize: 15)),
        SizedBox(height: 25),
      ],
    );
  }

  Widget _buildFeatureTile({
    required String title,
    required String imagePath,
    required String subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: ExpansionTile(
        controlAffinity: ListTileControlAffinity.leading,
        tilePadding: const EdgeInsets.only(left: 0),
        shape: const Border(bottom: BorderSide(color: Colors.blue, width: 2)),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(imagePath),
                const SizedBox(height: 20),
                _renderSubtitle(subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderSpecifications() {
    return Container(
      color: Color.fromRGBO(20, 100, 244, .102),
      width: double.infinity,
      padding: EdgeInsets.only(top: 64, left: 15, right: 15),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Text(
            'Thông số kỹ thuật',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey),
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Động cơ'), Text(widget.product['motor'] ?? '')],
            ),
          ),

          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Công suất tối đa (kW)'),
                Text(widget.product['maximum_power'] ?? ''),
              ],
            ),
          ),

          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('''Mô men xoắn cực đại 
(Nm)'''),
                Text(widget.product['maximum_torque'] ?? ''),
              ],
            ),
          ),

          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Tăng tốc'), Text(widget.product['speed'] ?? '')],
            ),
          ),

          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('''Quãng đường chạy 
một lần sạc đầy (km)'''),
                Text(widget.product['distance_traveled'] ?? ''),
              ],
            ),
          ),

          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('''Thời gian nạp pin 
nhanh nhất'''),
                Text(widget.product['charging_time'] ?? ''),
              ],
            ),
          ),

          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dẫn động	'),
                Text(widget.product['drive'] ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderInfoSUVCar({required String text1, required String text2}) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(text1, style: TextStyle(fontSize: 17)),
          SizedBox(height: 5),
          Text(text2, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _renderSection() {
    return SizedBox(
      width: double.infinity,
      height: 350,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.network(
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw6aa7c7a4/reserves/VF5/sp/bg-thong-so.webp',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Vận hành êm ái',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 30,
            right: 30,
            child: _renderTextSection(
              text:
                  'Công suất tối đa 134 mã lực, tương đương xe xăng 1,6L 4 xi lanh Mạnh mẽ, linh hoạt. Sẵn sàng cho mọi hành trình',
            ),
          ),
          Positioned(
            top: 190,
            left: 70,
            child: _renderTextSection(text: 'Dòng xe'),
          ),
          Positioned(
            top: 190,
            right: 20,
            child: _renderTextSection(text: 'Quãng đường di chuyển'),
          ),
          Positioned(
            top: 210,
            left: 70,
            child: _renderContentSection(text: widget.product['type']),
          ),
          Positioned(
            top: 210,
            right: 45,
            child: _renderTextSection(text: '(chuẩn NEDC)*'),
          ),
          Positioned(
            top: 210,
            left: 70,
            child: _renderContentSection(text: widget.product['type']),
          ),

          Positioned(
            top: 260,
            left: 45,
            child: _renderTextSection(text: 'Công suất tối đa'),
          ),
          Positioned(
            top: 260,
            right: 20,
            child: _renderTextSection(text: 'Mô men xoắn cực đại'),
          ),
          Positioned(
            top: 275,
            left: 70,
            child: _renderContentSection(
              text: widget.product['vehicle_capacity'],
            ),
          ),
          Positioned(
            top: 275,
            right: 52,
            child: _renderContentSection(text: widget.product['max_torque']),
          ),
        ],
      ),
    );
  }

  Widget _renderTextSection({required String text}) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _renderContentSection({required String text}) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _renderASUVSpecifications({
    required String title1,
    required String content1,
    required String title2,
    required String content2,
  }) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ),
                Text(
                  content1,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title2,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ),
                Text(
                  content2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderDescriptionSuvADetail({required String content}) {
    return Column(children: [Text(content, style: TextStyle(fontSize: 13))]);
  }

  Widget _renderSuvBDetail() {
    final product = widget.product;
    final List<String> images = List<String>.from(
      product['product_image_details'] ?? [],
    );
    final List<String> subTitles = List<String>.from(
      product['sub_titles'] ?? [],
    );
    final List<String> rangeNedcs = List<String>.from(
      product['range_nedc'] ?? [],
    );
    final List<String> sectionTitles = List<String>.from(
      product['section_titles'] ?? [],
    );
    final List<String> vehicleCapacities = List<String>.from(
      product['vehicle_capacity'] ?? [],
    );
    final List<String> maxTorques = List<String>.from(
      product['max_torque'] ?? [],
    );
    final List<String> wheelSizes = List<String>.from(
      product['wheel_size'] ?? [],
    );
    final List<String> prices = List<String>.from(product['price'] ?? []);
    return Column(
      children: [
        Image.asset(images[0], fit: BoxFit.cover),
        Container(
          width: double.infinity,
          color: Color.fromRGBO(218, 222, 222, 1),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                _renderBSUVSpecifications(
                  title1: 'Dung lượng pin',
                  content1: product['max_power'],
                  title2: 'Quảng đường (NEDC)* VF 6 Eco',
                  content2: rangeNedcs[0],
                ),
                SizedBox(height: 15),
                _renderBSUVSpecifications(
                  title1: 'Công suất tối đa VF 6 Plus',
                  content1: product['max_power'],
                  title2: 'Mô men xoắn cực đại VF 6 Plus',
                  content2: rangeNedcs[0],
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Color.fromRGBO(20, 100, 244, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'nhận ưu đãi'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 500,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(images[1], fit: BoxFit.contain),
              ),
              Positioned(
                top: 325,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: Colors.white,
                    width: 280,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  product['model'][0],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  product['model'][1],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Giá bán',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product['price'][0],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                product['price'][1],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Color.fromRGBO(
                                  20,
                                  100,
                                  244,
                                  1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    0,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text('đặt cọc'.toUpperCase()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 60),
        Text(
          'Cùng VF 6 ghi dấu từng khoảnh khắc, khởi đầu mọi hành trình.',
          style: TextStyle(fontSize: 19),
        ),
        Image.asset(images[2], fit: BoxFit.cover),
        SizedBox(height: 70),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Triết lý thiết kế "Cặp đối lập tự nhiên"',
            style: TextStyle(fontSize: 19),
          ),
        ),
        SizedBox(height: 15),
        Text(subTitles[0], style: TextStyle(fontSize: 15)),
        SizedBox(height: 30),
        CarouselSlider(
          carouselController: carouselControllerASUV1,
          options: CarouselOptions(
            height: 300,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            enableInfiniteScroll: true,
            autoPlay: false,
            enlargeCenterPage: true,
            padEnds: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex2 = index;
              });
            },
            initialPage: _currentIndex2,
          ),
          items: _images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      image['url']!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(Icons.error, color: Colors.grey[600]),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselControllerASUV1.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex2 == entry.key
                      ? Color.fromRGBO(20, 100, 244, 1)
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 15),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            sectionTitles[0],
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 15),
        Text(subTitles[1], style: TextStyle(fontSize: 15)),
        SizedBox(height: 25),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Color.fromRGBO(20, 100, 244, 1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(0),
              ),
            ),
            onPressed: () {},
            child: Text(
              'nhận ưu đãi'.toUpperCase(),
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        SizedBox(height: 10),
        CarouselSlider(
          carouselController: carouselControllerASUV2,
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            enableInfiniteScroll: true,
            autoPlay: false,
            enlargeCenterPage: true,
            padEnds: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex3 = index;
              });
            },
            initialPage: _currentIndex3,
          ),
          items: _images2.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      image['url']!,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(Icons.error, color: Colors.grey[600]),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _images2.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselControllerASUV2.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex3 == entry.key
                      ? Color.fromRGBO(20, 100, 244, 1)
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 15),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            sectionTitles[1],
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 15),
        Text(subTitles[2], style: TextStyle(fontSize: 15)),
        CarouselSlider(
          carouselController: carouselControllerASUV3,
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            enableInfiniteScroll: true,
            autoPlay: false,
            enlargeCenterPage: true,
            padEnds: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex4 = index;
              });
            },
            initialPage: _currentIndex4,
          ),
          items: _images3.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      image['url']!,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(Icons.error, color: Colors.grey[600]),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _images3.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselControllerASUV3.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex4 == entry.key
                      ? Color.fromRGBO(20, 100, 244, 1)
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 15),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            sectionTitles[2],
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 15),
        Text(subTitles[3], style: TextStyle(fontSize: 15)),
        SizedBox(height: 100),
        SizedBox(width: 330, child: _renderImageDetail(images[3])),
        SizedBox(height: 10),
        Text('Khả năng vận hành vượt trội', style: TextStyle(fontSize: 18)),
        SizedBox(height: 20),
        Text(
          'Với sức mạnh của động cơ điện tương đương với những mẫu xe thuộc phân khúc C-SUV, VF 6 chắc chắn sẽ thỏa mãn niềm đam mê cầm lái của chủ sở hữu, tự tin chinh phục mọi địa hình.',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product['model'][0], style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product['model'][1], style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          padding: EdgeInsets.only(bottom: 15),
          child: _renderASUVSpecifications2(
            title1: 'Dài x Rộng x Cao (mm)',
            content1: product['dimensions'],
            title2: '',
            content2: product['dimensions'],
          ),
        ),

        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          padding: EdgeInsets.only(bottom: 15),
          child: _renderASUVSpecifications2(
            title1: 'Chiều dài cơ sở',
            content1: product['wheelbase'],
            title2: '',
            content2: product['wheelbase'],
          ),
        ),

        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          padding: EdgeInsets.only(bottom: 15),
          child: _renderASUVSpecifications2(
            title1: 'Quãng đường di chuyển',
            content1: rangeNedcs[0],
            title2: '',
            content2: rangeNedcs[1],
          ),
        ),

        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          padding: EdgeInsets.only(bottom: 15),
          child: _renderASUVSpecifications2(
            title1: 'Công suất tối đa',
            content1: vehicleCapacities[0],
            title2: '',
            content2: vehicleCapacities[1],
          ),
        ),

        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          padding: EdgeInsets.only(bottom: 15),
          child: _renderASUVSpecifications2(
            title1: 'Mô men xoắn cực đại',
            content1: maxTorques[0],
            title2: '',
            content2: maxTorques[1],
          ),
        ),

        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          padding: EdgeInsets.only(bottom: 15),
          child: _renderASUVSpecifications2(
            title1: 'Kích thước La-zăng',
            content1: wheelSizes[0],
            title2: '',
            content2: wheelSizes[1],
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Color.fromRGBO(20, 100, 244, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'nhận tư vấn'.toUpperCase(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 15),
            SizedBox(
              height: 45,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color.fromRGBO(20, 100, 244, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(0),
                    side: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(20, 100, 244, 1),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'xem chi tiết'.toUpperCase(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        _buildAlbumSlider(),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _renderBSUVSpecifications({
    required String title1,
    required String content1,
    required String title2,
    required String content2,
  }) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content1,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(
                    title1,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    title2,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderASUVSpecifications2({
    required String title1,
    required String content1,
    required String title2,
    required String content2,
  }) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ),
                Text(
                  content1,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title2,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ),
                Text(
                  content2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlbumSlider() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              initialPage: _currentIndex5,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex5 = index;
                });
              },
            ),
            items: _images4.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(child: Text('Lỗi tải ảnh'));
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _images4.asMap().entries.map((entry) {
                            int index = entry.key;
                            return GestureDetector(
                              onTap: () =>
                                  _carouselController.animateToPage(index),
                              child: Container(
                                width: 10,
                                height: 10,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex5 == index
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.2),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _renderCUVDetail() {
    final product = widget.product;
    final List<String> introductions = List<String>.from(
      product['introductions'] ?? [],
    );
    final List<String> subTitles = List<String>.from(
      product['sub_titles'] ?? [],
    );
    final List<String> sectionTitles = List<String>.from(
      product['section_titles'] ?? [],
    );
    final List<String> titles = List<String>.from(product['titles'] ?? []);
    final List<String> descriptions = List<String>.from(
      product['descriptions'] ?? [],
    );
    return Column(
      children: [
        Image.network(
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw4fa68900/reserves/VF7/vf7-hero-banner-sp.webp',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: Icon(Icons.error, color: Colors.grey[600]),
            );
          },
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Image.network(
            'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw1517e263/reserves/VF7/vf7-logo-tagline.webp',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: Icon(Icons.error, color: Colors.grey[600]),
              );
            },
          ),
        ),
        Image.network(
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw6dd001b4/reserves/VF7/vf7-hero-car.webp',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: Icon(Icons.error, color: Colors.grey[600]),
            );
          },
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            child: Text(
              '*Hình ảnh mang tính minh họa, sử dụng hình ảnh của sản phẩm trong giai đoạn tiền thương mại.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Text(
            'Các thông tin sản phẩm có thể thay đổi mà không cần báo trước.',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 60),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Text(
            'Tùy chọn cho ngân sách của bạn',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 30),
        if (widget.product['model'] != null &&
            widget.product['model'] is List &&
            widget.product['price'] is List)
          Column(
            children: List.generate(widget.product['model'].length, (index) {
              final modelName = widget.product['model'][index];
              final modelPrice = widget.product['price'][index];
              return Padding(
                padding: EdgeInsets.only(bottom: 25, left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: modelName == 'VF 7 Plus Trần kính toàn cảnh'
                            ? RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'VF 7 Plus',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    TextSpan(text: '    '),
                                    TextSpan(
                                      text: ' Trần kính toàn cảnh',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Text(
                                modelName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: const Text(
                          'Giá xe:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 10,
                        ),
                        child: Text(
                          modelPrice,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        SizedBox(height: 20),
        SizedBox(
          width: 290,
          height: 45,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Color.fromRGBO(25, 100, 243, 1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(0),
              ),
            ),
            onPressed: () {},
            child: Text(
              'đặt cọc ngay'.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
        SizedBox(height: 60),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _renderIntroduction(product['introdutions'][0], 26, Colors.white),
              SizedBox(height: 20),
              Image.network(
                'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw28fb6184/reserves/VF7/vf7-uu-diem-6.webp',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.error, color: Colors.grey[600]),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
