import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterForConsultation extends StatefulWidget {
  final String types;
  const RegisterForConsultation({super.key, required this.types});

  @override
  _RegisterForConsultationState createState() =>
      _RegisterForConsultationState();
}

class _RegisterForConsultationState extends State<RegisterForConsultation> {
  bool isChecked = false;
  String name = "";
  String phone = "";
  String email = "";
  bool isValidate = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          color: widget.types == 'C-SUV'
              ? Color.fromARGB(255, 150, 150, 150)
              : Color.fromARGB(255, 207, 207, 207).withOpacity(.3),
          padding: EdgeInsets.only(top: 64, bottom: 60),
          child: Column(
            children: [
              Text(
                'ĐĂNG KÝ TƯ VẤN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.types == 'C-SUV' ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: widget.types == 'C-SUV'
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Đăng ký ngay để nhận ưu đãi mới nhất và tư vấn từ VinFast.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.types == 'C-SUV'
                      ? Colors.white
                      : Colors.black87,
                ),
              ),
              SizedBox(height: 30),

              SizedBox(
                width: 360,
                height: 50,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                      _validate();
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Họ và tên *',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),

              SizedBox(
                width: 360,
                height: 50,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                      _validate();
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Nhập số điện thoại *',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),

              SizedBox(
                width: 360,
                height: 50,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                      _validate();
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Email *',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: widget.types == 'C-SUV'
                              ? Colors.white
                              : Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Tôi đồng ý cho phép Công ty TNHH Kinh doanh Thương mại và Dịch vụ VinFast xử lý dữ liệu cá nhân của tôi và các thông tin khác do tôi cung cấp cho mục đích và theo phương thức được mô tả chi tiết tại ',
                          ),
                          WidgetSpan(
                            child: TextButton(
                              onPressed: () async {
                                const url =
                                    'https://www.example.com/privacy-policy';
                                if (await canLaunchUrl(Uri.parse(url))) {
                                  await launchUrl(Uri.parse(url));
                                }
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Chính sách Bảo vệ Dữ liệu cá nhân',
                                style: TextStyle(
                                  color: widget.types == 'C-SUV'
                                      ? const Color.fromARGB(255, 7, 122, 216)
                                      : Color.fromRGBO(20, 100, 244, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              SizedBox(
                width: 360,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: isValidate
                        ? Color.fromRGBO(20, 100, 244, 1)
                        : widget.types == 'C-SUV'
                        ? Color.fromRGBO(101, 101, 103, 1)
                        : Colors.grey,
                    foregroundColor: widget.types == 'C-SUV'
                        ? Colors.white
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: (isValidate && isChecked)
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Đăng ký thành công!")),
                          );
                        }
                      : null,
                  child: Text(
                    'ĐĂNG KÝ',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Ghi chú
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '(*)Lưu ý:\n\n'
            '• Các thông tin sản phẩm có thể thay đổi mà không cần báo trước.\n'
            '• Một số tính năng sẽ chưa có sẵn hoặc chưa được kích hoạt tại thời điểm giao xe cho Khách hàng.\n'
            '• Một số tính năng nâng cao có thể thuộc gói dịch vụ ADAS và Smart Services thu phí.\n'
            '• Quãng đường di chuyển được tính toán theo kiểm định tiêu chuẩn, thực tế có thể khác tùy điều kiện sử dụng.',
            style: TextStyle(
              fontSize: 13,
              color: widget.types == 'C-SUV' ? Colors.white : Colors.black87,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  bool _validate() {
    isValidate =
        name.isNotEmpty && phone.isNotEmpty && email.isNotEmpty && isChecked;
    return isValidate;
  }
}
