import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget{
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _renderInformation(),
        _renderFooter()
      ],
    );
  }

  Widget _renderFooter() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: RichText(text: 
            TextSpan(
              text: 'VỀ VINFAST',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
              recognizer: TapGestureRecognizer()
              ..onTap = () async {
                const url = 'https://vinfastauto.com/vn_vi/ve-chung-toi';
                if(await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Không thể mở $url';
                }
              }
            ),   
          ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.topLeft,
            child: RichText(text: 
            TextSpan(
              text: 'VỀ VINGROUP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
              recognizer: TapGestureRecognizer()
              ..onTap = () async {
                const url = 'https://vinfastauto.com/vn_vi/ve-vingroup';
                if(await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Không thể mở $url';
                }
              }
            ),
          ),
          ),
          ExpansionTile(
            shape: Border.all(
              width: 0,
              color: Colors.white
            ),
            tilePadding: EdgeInsets.only(left: 0),
              title: Text('TIN TỨC', style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black
                  ),
              ),
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  title: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Công ty', style: TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1),
                      ),),
                      SizedBox(height: 10,),
                      Text('Cộng đồng', style: TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1),
                      ),)
                    ],
                  ),
                  )
                )
              ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: RichText(text: 
            TextSpan(
              text: 'SHOWROOM & ĐẠI LÝ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
              recognizer: TapGestureRecognizer()
              ..onTap = () async {
                const url = 'https://vinfastauto.com/vn_vi/tim-kiem-showroom-tram-sac';
                if(await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Không thể mở $url';
                }
              }
            ),   
          ),
          ),
          ExpansionTile(
            shape: Border.all(
              width: 0,
              color: Colors.white
            ),
            tilePadding: EdgeInsets.only(left: 0),
              title: Text('ĐIỀU KHOẢN CHÍNH SÁCH', style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black
                  ),
              ),
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  title: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Chính sách bảo vệ dữ liệu cá nhân', style: TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1),
                      ),),
                      SizedBox(height: 10,),
                      Text('Chính sách vận chuyển', style: TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1),
                      ),),
                      SizedBox(height: 10,),
                      Text('Chính sách đổi trả', style: TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1),
                      ),),
                      SizedBox(height: 10,),
                      Text('Miễn trừ trách nhiệm', style: TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1),
                      ),),
                      SizedBox(height: 10,),
                      Text('Điều khoản ký kết thỏa thuận đặt cọc mua Ô tô VinFast', style: TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1),
                      ),),
                       SizedBox(height: 10,),
                      Text('Hợp đồng và chính sách', style: TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1),
                      ),),
                    ],
                  ),
                  )
                )
              ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('DỊCH VỤ KHÁCH HÀNG', style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10), 
                Row(
                  children: [
                    Icon(Icons.local_phone, color: const Color.fromARGB(255, 107, 105, 105)),
                    SizedBox(width: 15),
                    Text(
                      '1900 23 23 89', 
                      style: TextStyle(
                        color: Color.fromRGBO(20, 100, 244, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.email_rounded, color: const Color.fromARGB(255, 107, 105, 105)),
                    SizedBox(width: 15),
                    Text(
                      'support.vn@vinfastauto.com', 
                      style: TextStyle(
                        color: Color.fromRGBO(20, 100, 244, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text('SPEAK-UP HOTLINE', style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10), 
                Row(
                  children: [
                    Icon(Icons.local_phone, color: const Color.fromARGB(255, 107, 105, 105)),
                    SizedBox(width: 15),
                    Text(
                      '+842444582193', 
                      style: TextStyle(
                        color: Color.fromRGBO(20, 100, 244, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.email_rounded, color: const Color.fromARGB(255, 107, 105, 105)),
                    SizedBox(width: 15),
                    Text(
                      'v.speakup@vinfast.vn', 
                      style: TextStyle(
                        color: Color.fromRGBO(20, 100, 244, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Kết nối với Vinfast',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                        ),
                      ),
                      SizedBox(width: 40,),
                      Icon(Icons.facebook, color: const Color.fromARGB(255, 107, 105, 105), size: 20,),
                      IconButton(
                        onPressed: (){
                        }, 
                        icon: FaIcon(FontAwesomeIcons.youtube),
                        iconSize: 20,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hệ sinh thái',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Vinhome',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 107, 105, 105),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text('Vinmec',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 107, 105, 105),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text('Vinpearl',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 107, 105, 105),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset("assets/images/bct.png",
                    width: 150,
                    height: 150,
                  ),
                ),
                Center(
                  child: Text('VinFast. All rights reserved. © Copyright 2025'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _renderInformation() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/vinfast-logo-footer.png", 
            width: 150,
          ),
          SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Công ty TNHH Kinh doanh Thương mại và Dịch vụ VinFast',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'MST/MSDN: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '0108926276 do Sở KHĐT TP Hà Nội cấp lần đầu ngày 01/10/2019 và các lần thay đổi tiếp theo.',
                        style: TextStyle(
                          color: Color.fromRGBO(60, 60, 60, 1),
                          fontWeight: FontWeight.w400
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'Địa chỉ trụ sở chính: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Số 7, đường Bằng Lăng 1, Khu đô thị Vinhomes Riverside, Phường Việt Hưng, Quận Long Biên, Thành phố Hà Nội, Việt Nam',
                      style: TextStyle(
                        color: Color.fromRGBO(60, 60, 60, 1),
                        fontWeight: FontWeight.w400
                      )
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}