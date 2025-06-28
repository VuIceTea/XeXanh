import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String? productType;
  const Header({super.key, this.productType});

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

    _buttonsFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isCSUV = widget.productType == 'C-SUV';
    final logoColor = isCSUV ? Colors.white : null;
    final loginTextColor = isCSUV ? Colors.white : Colors.black;

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            child: Padding(
              padding: EdgeInsets.only(top: 45),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
                color: logoColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: _buttonsFadeAnimation,
                  builder: (context, child) {
                    return AnimatedOpacity(
                      opacity: _isExpanded ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 150),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: _isExpanded ? 0.0 : null,
                        child: _isExpanded
                            ? SizedBox.shrink()
                            : Row(
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
                                        color: loginTextColor,
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
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 6.0,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          20.0,
                                        ),
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
