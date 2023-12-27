import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shaza/util/string_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import '../util/color.dart';
import '../util/images.dart';

class CustomPortfolio extends StatefulWidget {
  const CustomPortfolio({
    super.key,
    required this.title,
    required this.description,
    required this.child,
    required this.image,
    required this.name,
  });

  final String name;
  final String title;
  final String description;
  final String image;
  final Widget child;
  @override
  State<CustomPortfolio> createState() => _CustomPortfolioState();
}

class _CustomPortfolioState extends State<CustomPortfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColorDark,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          child: Column(
            children: [
              40.height,
              Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: secondaryPrimaryColor),
              ),
              40.height,
              Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.bold, color: white),
              ),
              20.height,
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                        right: 30,
                        bottom: -20,
                        child: back.iconImage(size: 450, fit: BoxFit.fitWidth)),

                    // Positioned(
                    //     bottom: 10,
                    //     child: SizedBox(
                    //       height: MediaQuery.of(context).size.height / 3,
                    //       child: widget.image
                    //           .iconImage(size: 200, fit: BoxFit.cover),
                    //     )),
                    // Positioned(
                    //   right: 0,
                    //   left: 0,
                    //   top: -90,
                    //   child: shape.iconImage(
                    //     size: 550,
                    //     fit: BoxFit.fitWidth,
                    //   ),
                    // ),

                    // shaza.iconImage(size: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: widget.child,
    );
  }
}
