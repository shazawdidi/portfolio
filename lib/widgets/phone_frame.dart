import 'package:flutter/material.dart';
import 'package:shaza/util/color.dart';

class PhoneFrame extends StatelessWidget {
  final Widget child;

  PhoneFrame({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0, // Customize the phone frame size
      height: 600.0,
      decoration: BoxDecoration(
        color: primaryColor2,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: child,
          ),
          Positioned(
            top: 20.0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 100.0,
                height: 2.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 15.0,
          //   left: 0,
          //   right: 0,
          //   child: Center(
          //     child: Container(
          //       width: 120.0,
          //       height: 10.0,
          //       decoration: BoxDecoration(
          //         color: Colors.black,
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
