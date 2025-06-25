import 'package:flutter/material.dart';

class ChargingStation extends StatelessWidget{
  ChargingStation({super.key});

  final chargingStation = [
    {
      'id': 1,
      'title': '3,5 km - Khoảng cách nhỏ cho mục tiêu lớn',
      'subtitle': 'Định hình tiên phong thúc đẩy ngành công nghiệp xe điện, hướng tới một tương lai Xanh và Thông Minh, VinFast đã đầu tư hàng trăm triệu USD phát triển hạ tầng, từng bước "phủ rộng" trạm sạc xe điện:',
      'charge_item': ['Hệ thống trạm sạc xe điện VinFast trải dài 63 tỉnh và thành phố.', '106 tuyến quốc lộ quan trọng đều có trạm sạc.', '80/85 thành phố đã được lắp đặt hệ thống trạm sạc.', 'Khoảng cách ngắn 3,5 km giữa 2 trạm sạc trong thành phố.'],
      'commitment': 'VinFast cam kết nỗ lực mang đến nhiều tiện ích, giúp hành trình lái xe điện của người Việt thật dễ dàng!',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(36),
          color: const Color.fromRGBO(20, 100, 244, .102),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: chargingStation.map((station) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station['title'] as String,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
        
                  Text(
                    station['subtitle'] as String,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 40),
        
                  ...(station['charge_item'] as List<String>).map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("•  ", style: TextStyle(fontSize: 16)),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
        
                  const SizedBox(height: 20),
        
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color.fromRGBO(13, 66, 189, 1),
                          width: 4
                        )
                      )
                    ),
                    child: Text(
                      station['commitment'] as String,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(60, 60, 60, 1),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 36),
        _renderImageChargingMap('assets/images/map.jpg')
      ],
    );
  }
  
  _renderImageChargingMap(String? path) {
    return path == null
      ? SizedBox()
      : Image.asset(
          path,
          width: double.infinity,
          fit: BoxFit.cover,
      );
  }
}