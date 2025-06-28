import 'package:flutter/material.dart';
import 'package:selling_car/widgets/Footer.dart';
import 'package:selling_car/widgets/Slider.dart';
import 'package:selling_car/widgets/header.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  final CarouselSliderController carouselControllerPreferentialProducts =
      CarouselSliderController();
  final featuredImages = [
    'assets/images/vf8-slider.png',
    'assets/images/vf7-slider.png',
    'assets/images/vf9-slider.png',
  ];

  final _itemCars = [
    {
      'id': 1,
      'image_path': 'assets/images/vf3-red.png',
      'type': 'Mini Car',
      'name': 'Vinfast VF3',
      'price': '238.000.000 VNĐ',
      'similar_photos': [
        'assets/images/vf3-red.png',
        'assets/images/vf3-yellow.png',
        'assets/images/vf3-blue.png',
        'assets/images/vf3-pink.png',
      ],
      'introductions': [
        'VinFast VF 3 - Xe nhỏ, giá trị lớn.',
        'VinFast VF 3 - Tự do sáng tạo, toả sáng chất riêng!',
        'VinFast VF 3 - Luôn đủ chỗ cho mọi người!',
      ],
      'sub_titles': [
        'Với thiết kế tối giản, nhỏ gọn, cá tính và năng động, VinFast VF 3 sẽ luôn cùng bạn hoà nhịp với xu thế công nghệ di chuyển xanh toàn cầu, trải nghiệm giá trị trên mỗi hành trình, và tự do thể hiện phong cách sống.',
        'Với dải màu ngoại thất đa dạng và độc đáo, bao gồm 7 tùy chọn màu sắc trẻ trung và thời thượng, VF 3 là sự lựa chọn hoàn hảo giúp bạn thoả sức thể hiện sự khác biệt và cá tính của riêng mình. Dù bạn là ai, hãy lựa chọn màu sắc và trang bị VF 3 theo sở thích của bạn, và cùng VinFast biến ước mơ của bạn thành hiện thực.',
        'VF 3 là mẫu xe hiếm hoi trong phân khúc xe sở hữu la-zăng kích thước 16 inch, không chỉ tạo điểm nhấn về thiết kế mà còn góp phần gia tăng khả năng di chuyển trên địa hình đa dạng trong đô thị. Đặc biệt, VF 3 được trang bị tuỳ chọn ốp la-zăng, tăng thêm vẻ cá tính, sự sang trọng cho chiếc xe.',
        'Vượt lên trên một phương tiện di chuyển thông thường, VinFast VF 3 là biểu tượng mới mang tính cách mạng trong cuộc sống đô thị. Với thiết kế hiện đại, hiệu suất vận hành linh hoạt, tính năng an toàn tiên tiến, cùng chi phí vận hành siêu rẻ, VF 3 sẽ mở ra một cách tiếp cận hoàn toàn mới trong việc lựa chọn phương tiện di chuyển hàng ngày, mang lại sự thuận tiện, dễ dàng và đặc biệt thoải mái cho tất cả mọi người.',
        'Mà còn là một tác phẩm nghệ thuật kết hợp giữa công nghệ và sự sáng tạo trong thiết kế.',
        'Thiết kế thông minh và không gian nội thất tối ưu hóa của VF 3 mang lại trải nghiệm di chuyển tiện lợi, đảm bảo sự thoải mái và tiện nghi cho cả 4 chỗ ngồi. Màu sắc nội thất trang nhã, trẻ trung và cá tính, cùng chất liệu thân thiện tạo ra một không gian đặc biệt, nơi chứa đựng những kỷ niệm đáng nhớ trên mọi hành trình khám phá phong cách sống của riêng bạn!',
      ],
      'section_titles': [
        'La-zăng vượt trội về kích thước & phong cách.',
        'VinFast VF 3 - Biểu tượng mới của cuộc sống đô thị.',
        'VF 3 không chỉ là một chiếc xe điện tiên tiến.',
      ],
      'video':
          'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw3bedfd7b/reserves/VF3/TVC_VF3_Online_1080.mp4',
      'product_image_details': [
        'assets/images/vf3-1.png',
        'assets/images/vf3section-4.1.jpg',
        'assets/images/vf3section-5-mb.jpg',
        'assets/images/VF3_Interior_Hero_mb.jpg',
      ],
      'motor': '01 Motor',
      'maximum_power': '30',
      'maximum_torque': '110',
      'speed': '5,3s (0-50 km/h)',
      'distance_traveled': '215',
      'charging_time': '36 phút (10% - 70%)',
      'drive': 'RWD/Cầu sau',
    },
    {
      'id': 2,
      'image_path': 'assets/images/vf8-slider.png',
      'type': 'SUV D',
      'name': 'Vinfast VF8',
      'price': ['1.019.000.000 VNĐ', '1.199.000.000 VNĐ'],
      'similar_photos': [
        'assets/images/vf8-slider.png',
        'assets/images/vf8-green.webp',
        'assets/images/vf8-black.webp',
        'assets/images/vf8-blue.webp',
        'assets/images/vf8-orange.webp',
      ],
      'version': [
        'assets/images/vf8eco-white.webp',
        'assets/images/vf8plus-red.webp',
      ],
      'model': ['VF 8 Eco', 'VF 8 Plus'],
      'distance': ['562 km', 'pin cao cấp từ CATL'],
      'time': ['5.58 giây', ' 0-100 Km/h'],
      'vehicle_capacity': [
        '402 hp​',
        'tương đương động cơ đốt trong dung tích 3.2l',
      ],
      'charging_time': ['31 phút', 'sạc nhanh từ 10-70%'],
      'product_image_details': [
        'assets/images/thietkekdh.webp',
        'assets/images/guong.webp',
        'assets/images/panorama.webp',
        'assets/images/360.webp',
        'assets/images/giamsatnl.webp',
        'assets/images/gheda-vegan.webp',
        'assets/images/volang.webp',
        'assets/images/hud.webp',
        'assets/images/ai.webp',
        'assets/images/sota.webp',
        'assets/images/vapp.webp',
        'assets/images/journey.webp',
        'assets/images/sos.webp',
        'assets/images/11-boombag.webp',
      ],
      'introductions': [
        'VF 8 series mới',
        'Thiết kế cá nhân hoá',
        'Thăng hạng đẳng cấp',
        'Công nghệ tiên phong',
        'Sẵn sàng cho mọi hành trình',
        'An toàn của gia đình bạn là ưu tiên trên hết của VinFast',
        'Công nghệ nâng tầm trải nghiệm',
      ],
      'section_titles': [
        'Thiết kế khí động học​',
        'Gương chiếu hậu hiện đại',
        'Cửa sổ trời toàn cảnh',
        'Cảm biến và camera 360 độ',
        'Hệ thống giám sát người lái',
        'Ghế da vegan tích hợp sưởi và thông gió',
        'Vô lăng tối ưu cho mọi trải nghiệm',
        'HUD tích hợp sẵn',
        'Cứu hộ khẩn cấp',
        'Hệ thống 11 túi khí',
      ],
      'sub_titles': [
        'VF 8 Eco và VF 8 Plus đem đến đa dạng sự lựa chọn màu ngoại thất, phù hợp cho những chủ nhân yêu thích sự hiện đại, phong cách và sang trọng.',
        'Giảm lực cản không khí và tăng hiệu quả vận hành, đồng thời mang lại vẻ ngoài hiện đại và mạnh mẽ.',
        'Tự động lưu vị trí theo thói quen của chủ xe, tích hợp đèn báo rẽ và cảnh báo điểm mù tăng tăng cường sự an toàn cho Khách hàng.',
        'Tích hợp rèm điện, điều khiển đóng mở bằng giọng nói.',
        'Giúp tài xế dễ dàng quan sát và điều khiển trong không gian hẹp hay các khu vực đông đúc.',
        'VF 8 Eco và VF 8 Plus dành cho những người hiểu rõ giá trị sang trọng và đẳng cấp, mong muốn tận hưởng trọn vẹn những trải nghiệm cho bản thân và gia đình.',
        'Liên tục theo dõi và cảnh báo khi người lái mệt mỏi, vì bạn và gia đình.',
        'Đảm bảo sự thoải mái tối đa cho mọi hành trình, cho cả mùa hè và mùa đông.',
        'Không chỉ tích hợp khả năng sưởi, vô lăng của VF 8 còn có thể ghi nhớ và tự động điều chỉnh theo thói quen lái xe của bạn.',
        'Hiển thị các thông tin quan trọng như tốc độ xe, chỉ dẫn đường đi, cảnh báo va chạm ngay trên kính lái, cho phép người lái theo dõi mọi thông tin mà không cần rời mắt khỏi đường.',
        'VF 8 Eco và VF 8 Plus là sự lựa chọn lý tưởng cho những người đam mê công nghệ, với trợ lý ảo tích hợp công nghệ AI tạo sinh, mang đến trải nghiệm tương tác và điều khiển xe thân thiện, gần gũi và thực sự hữu dụng.',
        'Trợ lý ảo ViVi 2.0',
        'Trợ lý ảo ViVi 2.0 phiên bản mới nhất, ứng dụng công nghệ AI tạo sinh, mang đến khả năng tương tác, điều khiển xe bằng giọng nói tiếng Việt hoàn toàn tự nhiên...',
        'Cập nhật từ xa',
        'Bên cạnh nâng cấp tại xưởng, VinFast cũng sẽ cung cấp dịch vụ nâng cấp xe từ xa, giúp bạn cập nhật phần mềm và tính năng mới nhất cho xe của mình một cách thuận tiện và tiết kiệm thời gian nhất.',
        'Ứng dụng Vinfast',
        'Với ứng dụng VinFast, Khách hàng kiểm tra tình trạng của các trạm sạc, xem dữ liệu về xe, đặt lịch bảo dưỡng, trợ giúp. Quan trọng hơn, ứng dụng VinFast giúp điều khiển xe, bật điều hòa từ xa để bạn luôn thoải mái ngay từ khi bước lên xe.',
        'Với quãng đường di chuyển mỗi lần sạc đầy lên tới 562 km, kết hợp với hệ thống trạm sạc phủ sóng trên 63 tỉnh thành và nhiều ưu đãi đặc quyền dành riêng độc đáo, VinFast VF 8 cam kết sẵn sàng cùng bạn chinh phục mọi hành trình, cùng bạn tận hưởng không khí trong lành và khung cảnh thiên nhiên tươi đẹp trên mọi nẻo đường tại Việt Nam.',
        'Tất cả các xe VinFast tuân thủ các tiêu chuẩn an toàn nghiêm ngặt nhất và được trang bị những công nghệ hiện đại theo chuẩn quốc tế, mang lại sự yên tâm tuyệt đối cho gia đình bạn trên mọi chặng đường.',
        'Khi nguy cấp, bạn có thể dễ dàng nhấn nút SOS tích hợp sẵn để nhận được sự trợ giúp nhanh chóng.',
        'Sở hữu nhiều túi khí nhất trong phân khúc, bảo vệ bạn trong những trường hợp khẩn cấp.',
        'Hệ thống trợ lái nâng cao của VinFast được trang bị công nghệ và trang thiết bị hiện đại nhất, mang đến trải nghiệm lái xe thư thái và dễ dàng. Điều này giúp bạn tận hưởng cuộc sống và kết nối với gia đình cũng như thiên nhiên một cách trọn vẹn!',
      ],
    },
    {
      'id': 3,
      'image_path': 'assets/images/vfe34-slider.png',
      'type': 'SUV C',
      'name': 'Vinfast VFe34',
      'price': '721.000.000 VNĐ',
      'carline': 'assets/images/logonerio.webp',
      'similar_photos': [
        'assets/images/e34-black.png',
        'assets/images/e34-brown.png',
        'assets/images/e34-green.png',
        'assets/images/e34-silver.png',
        'assets/images/e34-yellow.png',
        'assets/images/e34-white.png',
        'assets/images/e34-red.png',
        'assets/images/e34-blue.png',
      ],
      "dimensions": "4300 x 1768 x 1615",
      "wheelbase": "2611 mm",
      "ground_clearance": "165 mm",
      "max_power": "110 kW",
      "max_torque": "242 Nm",
      "range_nedc": "318,6 km/lần sạc đầy",
      "usable_battery": "41,9 kWh",
      "max_dc_charge": "60 kW",
      "charge_time": "27 phút (10%-70%)",
      "drivetrain": "FWD/Cầu trước",
      "drive_modes": "Eco/Comfort/Sport",
      "suspension": "MacPherson/Dầm xoắn",
      "brakes": "Đĩa/Đĩa",
      "wheel_size": "18 inch",
      "headlights": "LED",
      "trunk_operation": "Chỉnh điện",
      "air_conditioning": "Tự động 1 vùng",
      "touchscreen": "10 inch",
      "audio_system": "6 loa",
      "driver_seat": "Chỉnh cơ 6 hướng",
      'fuel_consumption': '13 kWh/100 km',
    },
  ];

  final _preferentialProducts = [
    {
      'id': 1,
      'image_path': 'assets/images/vf5-pink.png',
      'type': 'A-SUV',
      'name': 'Vinfast VF5',
      'price': '458.000.000 VNĐ',
      'banner': 'assets/images/vf5-hero-sp.webp',
      'photos': [
        'assets/images/vf5-color-yellow.webp',
        'assets/images/vf5-color-green.webp',
        'assets/images/vf5-color-blue.webp',
        'assets/images/vf5-color-grey.webp',
      ],
      'colorType': [
        'VF 5 - SUMMER YELLOW',
        'VF 5 - URBAN MINT',
        'VF 5 - SKY BLUE',
        'VF 5 - ZENITH GREY',
      ],
      'title': [
        'Tự Teen Dẫn Lối Tự Do',
        'Phiêu nhịp sống xanh',
        'Chuyển động đa Z năng',
        'Toàn tâm công tác',
      ],
      'description': [
        'Chọn khai mở cung đường mới thay vì lối mòn rập khuôn, năng lượng từ Summer Yellow giúp Kaity tự tin vào chất trẻ trung trong mình - để tinh thần tự do phóng khoáng luôn vượt lên những rào cản không tên. Giới hạn sẽ không bao giờ nằm trong từ điển cuộc sống, một khi có sắc vàng của VinFast 5 dẫn lối.',
        'Hiện đại với sắc xanh tươi mát, sống động và thân thiện với môi trường. Màu xanh mint mang đến cho Hà cảm giác tươi mới, đầy năng lượng, giúp Hà tận hưởng nhịp sống đô thị một cách trọn vẹn và đầy cảm hứng.',
        'Hơn cả một màu sắc, Sky Blue đối với Amee đại diện cho cá tính đậm nét Gen Z, chất “đa-zi-năng” và phong cách trẻ trung năng động. Mọi chuyển động cùng sắc xanh  Sky Blue chính là tuyên ngôn cho thần thái khác biệt của hội Gen Z.',
        'Lựa chọn sắc xám chính là lựa chọn thành công - toàn tâm toàn ý cho mọi “công task” trên hành trình sự nghiệp. Là biểu tượng của sự uy tín và mạnh mẽ, GreyD tin rằng Zenith Grey sẽ mang đến thần thái chuyên nghiệp, đẳng cấp và tự tin trên mọi con đường bạn lựa chọn.',
      ],
      'similar_photos': [
        'assets/images/vf5-black.png',
        'assets/images/vf5-blue.png',
        'assets/images/vf5-bluewhite.png',
        'assets/images/vf5-red.png',
        'assets/images/vf5-white.png',
        'assets/images/vf5-whitepink.png',
        'assets/images/vf5-yellow.png',
      ],
      "range_nedc": "326,4 km/lần sạc",
      'vehicle_capacity': '134 hp',
      'max_torque': '135 Nm',
      "dimensions": "3.967 x 1.723 x 1.579",
      'total_seat': '5 ghế',
      "usable_battery": "37,23 Kwh",
      "charge_time": "33 phút",
      "wheel_size": "Hợp kim 17 inch",
      'number_airbag': '6 túi khí',
      'fuel_consumption': '13 kWh/100 km',
      'sub_titles': [
        'VF 5 sở hữu thiết kế hiện đại, trẻ trung, cá tính và nổi bật với các lựa chọn phối màu nội ngoại thất, đảm bảo cá nhân hóa theo phong cách sống, cá tính và sở thích của mỗi khách hàng.',
        'VinFast VF 5 được trang bị đầy đủ những công nghệ tiên tiến bậc nhất:',
        'Giám sát hành trình cơ bản',
        'Cảnh báo giao thông phía sau',
        'Cảnh báo điểm mù',
        'Hỗ trợ đỗ xe phía sau',
        'Hỗ trợ phanh khẩn cấp...',
        'Tích hợp các ứng dụng, tiện ích thông minh như:',
        'Trợ lý ảo điều khiển bằng giọng nói',
        'Giúp nâng tầm trải nghiệm và kiến tạo một phong cách sống đẳng cấp, văn minh, hiện đại cho người sở hữu.',
      ],
    },
    {
      'id': 2,
      'image_path': 'assets/images/vf6-red.png',
      'type': 'B-SUV',
      'name': 'Vinfast VF6',
      'model': ['VF 6 Eco', 'VF 6 Plus'],
      'price': ['689.000.000 VNĐ', '749.000.000 VNĐ'],
      "max_power": "59.6 kW",
      "range_nedc": ["480 km/lần sạc", '460 km/lần sạc'],
      'vehicle_capacity': ['130 kW/174 hp', '150 kW/201 hp'],
      "max_torque": ['250 Nm', '310 Nm'],
      'dimensions': '4.241 x 1.834 x 1.580',
      "wheelbase": "2.730 mm",
      "wheel_size": ['17 inch', "18 inch"],
      'exteriorsCarousel': [
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
      ],
      'interiorsCarousel': [
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
      ],
      'technologiesCarousel': [
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
      ],
      'bottomCarousel': [
        'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw645188ef/reserves/VF6/VF6-Lifestyle-01.jpg',
        'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw728cff84/reserves/VF6/VF6-Lifestyle-02.jpg',
        'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwa7b70283/reserves/VF6/VF6-Lifestyle-03.jpg',
        'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwc530fef9/reserves/VF6/VF6-Lifestyle-04.jpg',
        'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw1135ee4f/reserves/VF6/VF6-Lifestyle-05.jpg',
        'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwe7e90ba1/reserves/VF6/VF6-Lifestyle-06.jpg',
      ],
      'product_image_details': [
        'assets/images/VF6-banner.webp',
        'assets/images/bottom-banner-mb.webp',
        'assets/images/VF6-Lifestyle-00.jpg',
        'assets/images/logo-car-VF6-2.png',
      ],
      'similar_photos': [
        'assets/images/vf6-black.png',
        'assets/images/vf6-white.png',
        'assets/images/vf6-grey.png',
        'assets/images/vf6-red.png',
        'assets/images/vf6-green.png',
      ],
      'sub_titles': [
        'VF 6 là tuyệt tác nghệ thuật được thiết kế dựa trên triết lý “Cặp đối lập tự nhiên”, tạo nên sự cân bằng hoàn hảo giữa các yếu tố tưởng chừng như đối lập: thú vị - tinh tế, công nghệ - con người.',
        'Thiết kế ngoại thất được khởi tạo từ những đường nét tinh tế đến từng chi tiết cùng vẻ ngoài năng động, ấn tượng ngay từ ánh nhìn đầu tiên.',
        'Thiết kế nội thất lấy cảm hứng từ ngôi nhà thứ hai của gia đình với không gian rộng rãi, thoải mái cùng hai màu nội thất và chất liệu tự nhiên, thân thiện với người dùng.',
        'VF 6 mang đến cho người dùng cả “thế giới công nghệ” với trợ lý ảo VinFast cùng nhiều tính năng an toàn, giải trí và tiện ích đẳng cấp.',
      ],
      'section_titles': ['Ngoại thất​', 'Nội thất', 'Công nghệ'],
    },
    {
      'id': 3,
      'image_path': 'assets/images/vf7-slider.png',
      'type': 'C-SUV',
      'name': 'Vinfast VF7',
      'price': ['799.000.000 VNĐ', '949.000.000 VNĐ', '969.000.000 VNĐ'],
      'model': ['VF 7 Eco', 'VF 7 Plus', 'VF 7 Plus Trần kính toàn cảnh'],
      'video':
          'https://static-bucket-sfcc.vinfastauto.com/6-traffic-jam-and-highway-assist.mp4',
      'introdutions': [
        'VF 7 là một bước tiến đột phá trong thiết kế xe ô tô của VinFast.',
        'Ngoại thất kế thừa và đổi mới từ hơn trăm năm lịch sử của ngành ô tô.',
        'Thiết kế nội thất hướng tới người lái.',
        'Cầm lái với đam mê.',
        'Hệ thống trợ lái nâng cao.',
        'Trần kính toàn cảnh (tùy chọn)',
      ],
      'sub_titles': [
        'Lấy cảm hứng từ vũ trụ và các vật thể bay trong không gian, VF 7 hiện thân cho sự tự do, công nghệ, thời đại, cá tính, mạnh mẽ và thể thao, thoả mãn mọi tâm hồn đam mê thẩm mỹ và tốc độ.',
        'Những đường nét và hình khối được sử dụng nhịp nhàng và tinh tế, mang đến cho chủ nhân VF 7 không gian trải nghiệm đầy phóng khoáng và tràn đầy năng lượng; song vẫn không làm mất đi sự tối giản, tinh khiết và thời trang vốn có của mẫu xe đánh thức mọi đam mê.',
        'Thiết kế phần đầu xe thon gọn, dựa trên hình ảnh của chiếc phi thuyền không gian, với điểm nhấn là cụm đèn định vị cánh chim - chữ V đặc trưng kéo dài liên tưởng tới những pha bứt tốc mạnh mẽ vượt thời không và sự chuyển hướng linh hoạt trên không trung.',
        'Tận hưởng hành trình trong không gian riêng tư và rộng rãi của chiếc xe, nơi mỗi chi tiết mang đậm dấu ấn cá nhân tạo nên cuộc phiêu lưu độc đáo của riêng bạn.',
        'Tất cả tiện nghi đều nằm trong tầm tay người lái, giúp mang tới kết nối liền mạch giữa người và xe.',
        'Mở rộng không gian, mang tới trải nghiệm cao cấp trên mỗi hành trình.',
        'Ứng dụng công nghệ và trang thiết bị hiện đại nhất, hệ thống trợ lái nâng cao VinFast đem lại trải nghiệm lái thư thái, dễ dàng để bạn an tâm tận hưởng cuộc sống.',
        'Hỗ trợ lái trên đường cao tốc.',
        'Ứng dụng công nghệ và trang thiết bị hiện đại nhất, hệ thống trợ lái nâng cao VinFast đem lại trải nghiệm lái thư thái, dễ dàng để bạn an tâm tận hưởng cuộc sống.',
      ],
      'section_titles': [
        'Triết lý thiết kế “Vũ trụ phi đối xứng”.',
        'VF 7 không chỉ là một chiếc xe điện tiên tiến, mà còn là một tác phẩm nghệ thuật kết hợp giữa công nghệ và sự sáng tạo trong thiết kế.',
        'Kiến tạo không gian trải nghiệm phóng khoáng, tự do và tràn đầy năng lượng.',
        'Tiện nghi hướng vào người lái',
        'Trần kính toàn cảnh (tùy chọn)',
        'Nội thất rộng rãi (Chiều dài cơ sở 2.840 mm, Dài x Rộng x Cao tương đương 4.545 x 1.890 x 1.635,75 mm).',
        'Quãng đường chạy một lần sạc đầy 498 km**.',
        'Sở hữu 8 túi khí*.',
        'Mô men xoắn cực đại 310 Nm.',
      ],
      'slider_items': [
        {
          'image':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwb8503fdb/reserves/VF7/vf7-uu-diem-1.webp',
          'title': 'Triết lý thiết kế “Vũ Trụ Phi Đối Xứng“',
          'description':
              'Thiết kế ngoại thất thể hiện sự tự do, cá tính, mạnh mẽ và thể thao, thoả mãn mọi tâm hồn đam mê thẩm mỹ và tốc độ.',
        },
        {
          'image':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwa32334bb/reserves/VF7/vf7-uu-diem-3.webp',
          'title': 'Trải nghiệm lái phấn khích',
          'description':
              'Công suất tối đa 150 kW*; Mô men xoắn cực đại 310 Nm* (*Thông số bản Plus)',
        },
        {
          'image':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwd20eda94/reserves/VF7/vf7-uu-diem-4.webp',
          'title': 'Chi phí lăn bánh hấp dẫn',
          'description':
              'Mức giá lăn bánh cạnh tranh (được miễn phí lệ phí trước bạ trong 2 năm từ 1/3/2025 theo Nghị định số 51/2025/NĐ - CP)',
        },
        {
          'image':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwe7e61fdb/reserves/VF7/vf7-uu-diem-5.webp',
          'title': 'Chi phí vận hành tối ưu',
          'description':
              'Chi phí năng lượng chỉ từ ~533 VNĐ/km*. (*Giả định khách hàng đi 3.000 km/tháng và giá điện tính theo đơn giá bậc 5 cập nhật tại tháng 11/2023 (3.355 VNĐ/số).)',
        },
        {
          'image':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw28fb6184/reserves/VF7/vf7-uu-diem-6.webp',
          'title': 'Hậu mãi cực tốt',
          'description':
              'Bảo hành 10 năm/200.000 km (tùy điều kiện nào đến trước); Xưởng dịch vụ không ngày nghỉ, sửa chữa lưu động, dịch vụ sạc pin lưu động/cứu hộ 24/7...',
        },
      ],
      'slider_items2': [
        {
          'image':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw4a2b0002/reserves/VF7/vf7-masterpiece-1.webp',
          'title': 'Tối ưu tính khí động học',
          'description':
              'Nắp capo thấp, trần xe và cửa sổ được vuốt thấp dần về phía sau, giúp tối ưu tính khí động học, tạo sự đầm chắc và ổn định khi di chuyển tốc độ cao.',
        },
        {
          'image':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwd1f60e64/reserves/VF7/vf7-masterpiece-2.webp',
          'title': 'Tay nắm cửa',
          'description':
              'Tay nắm ẩn trong thân xe, tạo ra sự liền mạch cho không khí đi qua. Mở cửa với thao tác ấn và kéo mang lại trải nghiệm mới lạ, khác biệt với tay nắm cửa truyền thống.',
        },
        {
          'image':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw7001a727/reserves/VF7/vf7-masterpiece-3.webp',
          'title': 'La-Zăng thể thao',
          'description':
              'Kích thước 20 inch (bản Plus), khẳng định thêm vẻ mạnh mẽ và thể thao cho VF 7.',
        },
        {
          'image':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw825532ba/reserves/VF7/vf7-masterpiece-4.webp',
          'title': 'Thân xe với đường gân dập nổi',
          'description':
              'Đường gân dập nổi nối liền bên hông xe, tạo sự liền mạch thể thao, phần đuôi xe cơ bắp và góc cạnh tô điểm cho chiếc xe thêm phần mạnh mẽ.',
        },
        {
          'image':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw279996e6/reserves/VF7/vf7-masterpiece-5.webp',
          'title': 'Gương chiếu hậu',
          'description':
              'Gập điện, chỉnh điện, đặt dưới cửa xe giúp hạn chế điểm mù, mở rộng tầm nhìn cho người lái.',
        },
      ],
      'colorOptions': [
        {
          'id': 'CE1M',
          'name': 'Crimson Red',
          'previewImage':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw4c3e07c9/reserves/VF7/exterior/product-CE1M.webp',
          'thumbnailImage':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw91273af3/reserves/color/exterior/CE1M.webp',
        },
        {
          'id': 'CE1V',
          'name': 'Zenith Grey',
          'previewImage':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwfee77d40/reserves/VF7/exterior/product-CE1V.webp',
          'thumbnailImage':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwee1166a3/reserves/color/exterior/CE1V.webp',
        },
        {
          'id': 'CE1W',
          'name': 'Urban Mint',
          'previewImage':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw613293fe/reserves/VF7/exterior/product-CE1W.webp',
          'thumbnailImage':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwf71dd9a6/reserves/color/exterior/CE1W.webp',
        },
        {
          'id': 'CE18',
          'name': 'Infinity Blanc',
          'previewImage':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw0c109403/reserves/VF7/exterior/product-CE18.webp',
          'thumbnailImage':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw76b01a92/reserves/color/exterior/CE18.webp',
        },
        {
          'id': 'CE11',
          'name': 'Jet Black',
          'previewImage':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwbe2e95be/reserves/VF7/exterior/product-CE11.webp',
          'thumbnailImage':
              'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dw51489d08/reserves/color/exterior/CE11.webp',
        },
      ],
      "feature_list": [
        "Nội thất rộng rãi (Chiều dài cơ sở 2.840 mm, Dài x Rộng x Cao tương đương 4.545 x 1.890 x 1.635,75 mm).",
        "Quãng đường chạy một lần sạc đầy 498 km**.",
        "Sở hữu 8 túi khí*.",
        "Mô men xoắn cực đại 310 Nm.",
      ],
      "max_power": ["59.6", "70.8"],
      "range_nedc": ["498", "496"],
      'vehicle_capacity': ['130', '150'],
      "max_torque": ['250', '310'],
      'dimensions': '4.545 x 1.890 x 1.635,75',
      "wheelbase": "2840",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Positioned(top: 0, left: 0, right: 0, child: Header()),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const SliderWidget(),
                  const SizedBox(height: 30),
                  _buildSectionTitle('SẢN PHẨM NỔI BẬT'),
                  const SizedBox(height: 20),
                  _renderOutstandingProducts(),
                  const SizedBox(height: 30),
                  _buildSectionTitle('SẢN PHẨM ƯU ĐÃI'),
                  const SizedBox(height: 20),
                  _renderPreferentialProducts(),
                  SizedBox(height: 50),
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/Banner-Vinfast-smal.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 400,
                        opacity: const AlwaysStoppedAnimation(.5),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(top: 70, bottom: 70),
                          child: Text(
                            'Đăng Ký Nhận Thông Tin',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        width: 420,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Đăng ký nhận thông tin chương trình khuyến mãi, dịch vụ VinFast.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 170,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: 40,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              color: Colors.white,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Nhập email của bạn',
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 12.0,
                                  ),
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 220,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 0,
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'ĐĂNG KÝ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 280,
                        width: 420,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Bằng cách đăng ký, Quý khách xác nhận đã đọc, hiểu và đồng ý với ',
                                  ),
                                  TextSpan(
                                    text: 'Chính sách Quyền riêng tư',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const url =
                                            'https://vinfastauto.com/vn_vi/dieu-khoan-phap-ly';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Không thể mở $url';
                                        }
                                      },
                                  ),
                                  TextSpan(text: ' của VinFast.'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(height: 3),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Xem tất cả sản phẩm',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderOutstandingProducts() {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              height: 250,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            items: _itemCars.map((itemCar) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        itemCar['image_path'] as String,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      itemCar['name'] as String,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Giá bán: ${_getFirstPrice(itemCar['price'])}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                              side: BorderSide(color: Colors.blue, width: 1.0),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            'ĐẶT CỌC',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        SizedBox(width: 10),
                        FilledButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/product-detail',
                              arguments: itemCar,
                            );
                          },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                              side: BorderSide(color: Colors.blue, width: 1.0),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          child: Text(
                            'XEM CHI TIẾT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Positioned(
            left: 16,
            top: 80,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  carouselController.previousPage();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black87,
                  size: 15,
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 80,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  carouselController.nextPage();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black87,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderPreferentialProducts() {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: carouselControllerPreferentialProducts,
            options: CarouselOptions(
              height: 250,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            items: _preferentialProducts.map((itemCar) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        itemCar['image_path'] as String,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      itemCar['name'] as String,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Giá bán: ${_getFirstPrice(itemCar['price'])}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                              side: BorderSide(color: Colors.blue, width: 1.0),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: Text(
                            'ĐẶT CỌC',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        SizedBox(width: 10),
                        FilledButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/product-detail',
                              arguments: itemCar,
                            );
                          },
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                              side: BorderSide(color: Colors.blue, width: 1.0),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          child: Text(
                            'XEM CHI TIẾT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Positioned(
            left: 16,
            top: 80,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  carouselControllerPreferentialProducts.previousPage();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black87,
                  size: 15,
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 80,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  carouselControllerPreferentialProducts.nextPage();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black87,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getFirstPrice(dynamic price) {
    if (price == null) return 'N/A';
    if (price is String) return price;
    if (price is List && price.isNotEmpty) return price[0];
    return 'N/A';
  }
}
