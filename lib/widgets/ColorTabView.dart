import 'package:flutter/material.dart';

class ColorTabView extends StatefulWidget {
  const ColorTabView({super.key});

  @override
  _ColorTabViewState createState() => _ColorTabViewState();
}

class _ColorTabViewState extends State<ColorTabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _currentColorName = 'Jet Black - Mystery Bronze Roof';

  final List<Map<String, String>> _colors = [
    {
      'id': 'CE11',
      'name': 'Jet Black',
      'image': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw7afb0815/reserves/VF8/exterior/product-CE11.webp',
      'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw51489d08/reserves/color/exterior/CE11.webp',
    },
    {
      'id': 'CE22',
      'name': 'Ivy Green',
      'image': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw585603bd/reserves/VF8/exterior/product-CE22.webp',
      'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw5b436975/reserves/color/exterior/CE22.webp',
    },
    {
      'id': 'CE18',
      'name': 'Infinity Blanc',
      'image': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw23b1a8cb/reserves/VF8/exterior/product-CE18.webp',
      'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw76b01a92/reserves/color/exterior/CE18.webp',
    },
    {
      'id': 'CE1M',
      'name': 'Crimson Red',
      'image': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwa5374fce/reserves/VF8/exterior/product-CE1M.webp',
      'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw91273af3/reserves/color/exterior/CE1M.webp',
    },
    {
      'id': '2927',
      'name': 'Crimson Velvet - Mystery Bronze Roof',
      'image': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw8fd36b28/reserves/VF8/exterior/product-2927.webp',
      'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwb5a54fc1/reserves/color/exterior/2927.webp',
    },
    {
      'id': '171V',
      'name': 'Zenith Grey - Desat Silver Roof',
      'image': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw3c86c99b/reserves/VF8/exterior/product-171V.webp',
      'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw93273248/reserves/color/exterior/171V.webp',
    },
    {
      'id': '1V18',
      'name': 'Infinity Blanc - Zenith Grey Roof',
      'image': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw3d5c80e6/reserves/VF8/exterior/product-1V18.webp',
      'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw61563be0/reserves/color/exterior/1V18.webp',
    },
    {
      'id': '2911',
      'name': 'Jet Black - Mystery Bronze Roof',
      'image': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw1fd81418/reserves/VF8/exterior/product-2911.webp',
      'icon': 'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw1c4fe27c/reserves/color/exterior/2911.webp',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _colors.length, initialIndex: _colors.indexWhere((color) => color['id'] == '2911'), vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentColorName = _colors[_tabController.index]['name']!;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 190, 
          child: TabBarView(
            controller: _tabController,
            children: _colors.map((color) {
              return Image.network(
                color['image']!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Lỗi tải ảnh'));
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _colors.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> color = entry.value;
              return GestureDetector(
                onTap: () {
                  _tabController.animateTo(index);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _tabController.index == index ? Colors.blue : Colors.grey,
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
        const SizedBox(height: 8),
        Text(
          _currentColorName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}