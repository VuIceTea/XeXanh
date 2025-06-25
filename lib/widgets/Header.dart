import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _buttonsFadeAnimation;
  late TextEditingController _textEditingController;
  final bool _isExpanded = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );



    _buttonsFadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.5, curve: Curves.easeOut),
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  // void _toggleSearch() {
  //   setState(() {
  //     _isExpanded = !_isExpanded;
  //     if (_isExpanded) {
  //       _animationController.forward();
  //       Future.delayed(Duration(milliseconds: 250), () {
  //         if (mounted && _isExpanded) {
  //           _focusNode.requestFocus();
  //         }
  //       });
  //     } else {
  //       _focusNode.unfocus();
  //       _textEditingController.clear();
  //       _animationController.reverse();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/images/logo-mobile.svg", 
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // AnimatedBuilder(
                //   animation: _widthAnimation,
                //   builder: (context, child) {
                //     return Container(
                //       height: 48.0,
                //       width: _widthAnimation.value,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(24.0),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.1),
                //             spreadRadius: 0,
                //             blurRadius: 10.0,
                //             offset: Offset(0.0, 4.0),
                //           ),
                //         ],
                //       ),
                //       child: Row(
                //         children: [
                //           if (_isExpanded)
                //             Expanded(
                //               child: FadeTransition(
                //                 opacity: _fadeAnimation,
                //                 child: Padding(
                //                   padding: EdgeInsets.only(left: 16.0, right: 8.0),
                //                   child: TextField(
                //                     controller: _textEditingController,
                //                     focusNode: _focusNode,
                //                     decoration: InputDecoration(
                //                       hintText: 'Tìm kiếm...',
                //                       hintStyle: TextStyle(
                //                         color: Colors.grey[500],
                //                         fontSize: 14.0,
                //                       ),
                //                       border: InputBorder.none,
                //                       contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                //                     ),
                //                     onSubmitted: (value) {
                //                       print('Searching for: $value');
                //                     },
                //                   ),
                //                 ),
                //               ),
                //             ),
                          
                //           Container(
                //             width: 48.0,
                //             height: 48.0,
                //             decoration: BoxDecoration(
                //               color: _isExpanded ? Colors.grey[100] : Colors.transparent,
                //               borderRadius: BorderRadius.circular(24.0),
                //             ),
                //             child: IconButton(
                //               icon: AnimatedRotation(
                //                 turns: _isExpanded ? 0.25 : 0.0,
                //                 duration: Duration(milliseconds: 300),
                //                 child: Icon(
                //                   _isExpanded ? Icons.close : Icons.search,
                //                   color: Colors.grey[700],
                //                   size: 20.0,
                //                 ),
                //               ),
                //               onPressed: _toggleSearch,
                //               splashRadius: 20.0,
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // ),
                
                SizedBox(width: _isExpanded ? 8.0 : 16.0),
                
                AnimatedBuilder(
                  animation: _buttonsFadeAnimation,
                  builder: (context, child) {
                    return AnimatedOpacity(
                      opacity: _isExpanded ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 150),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: _isExpanded ? 0.0 : null,
                        child: _isExpanded ? SizedBox.shrink() : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {
                                print('Đăng nhập pressed');
                              },
                              child: Text(
                                'Đăng nhập',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            TextButton(
                              onPressed: () {
                                print('Đăng ký pressed');
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                'Đăng ký',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}