import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../util/color.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('About My Portfolio App?',
            style: TextStyle(
              fontSize: 20,
            )),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
                "Thank you for Installing my portfolio. I hope my work demonstrates the quality and dedication I bring to every Flutter project. Feel free to explore, and don't hesitate to get in touch to discuss your ideas or explore potential collaborations",
                style: TextStyle(
                  fontSize: 14,
                )),
            AboutWidget(
              title: "How I Developed My Portfolio ?",
              description:
                  "- I Design the user interface of my portfolio app. \n- I Used Flutter widgets to build the UI. Popular \n   choices include Column, ListView, Card, Text, and \n   Image widgets...etc.\n- I designed a cool Speed Dial menu to show my\n   Contact Information & Social Profiles",
              icon: Icons.developer_mode,
            ),
            AboutWidget(
              title: "Why ?",
              description: "To showcase my skills",
              icon: Icons.ad_units_sharp,
            ),
            AboutWidget(
              title: "What Next ?",
              description:
                  " I am Willing to Add feature by all advanced topics in Flutter  ",
              icon: Icons.next_plan_outlined,
            )
          ],
        ),
      ),
    );
  }
}

class AboutWidget extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const AboutWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 25,
          ),
          5.width,
          Text(title,
              style: const TextStyle(
                fontSize: 20,
              )),
        ],
      ),
      subtitle: Text(description,
          style: const TextStyle(
            fontSize: 14,
          )),
    );
  }
}
