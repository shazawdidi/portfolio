import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shaza/util/color.dart';
import 'package:shaza/widgets/custom_portfolio.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomPortfolio(
      title: "   Flutter Developer",
      name: " Shazalia Moawia",
      description: "",
      image: shaza,
      child: SpeedDial(
        animatedIcon: AnimatedIcons.menu_arrow, // Icon to toggle the Speed Dial
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.call,
              color: primaryColor,
              size: 25,
            ),
            label: 'Call',
            labelStyle: TextStyle(
              fontFamily: 'Cairo',
            ),
            onTap: () {
              _launchPhoneCall();
            },
          ),
          SpeedDialChild(
            child: SvgPicture.asset(
              'assets/svg/icons_gmail.svg', // Replace with your linkedin.svg file path
              width: 25.0,
            ),
            label: 'Email',
            labelStyle: TextStyle(
              fontFamily: 'Cairo',
            ),
            onTap: () {
              _launchEmail();
            },
          ),
          SpeedDialChild(
            child: SvgPicture.asset(
              'assets/svg/icons_github.svg', // Replace with your linkedin.svg file path
              width: 30.0,
            ),
            label: 'Github',
            labelStyle: TextStyle(
              fontFamily: 'Cairo',
            ),
            onTap: () {
              _launchAnyUrl("http://github.com/shazawdidi");
            },
          ),
          SpeedDialChild(
            child: SvgPicture.asset(
              'assets/svg/icons_linkedin.svg', // Replace with your linkedin.svg file path
              width: 30.0,
            ),
            label: 'LinkedIn',
            labelStyle: TextStyle(
              fontFamily: 'Cairo',
            ),
            onTap: () {
              _launchAnyUrl(
                  "https://www.linkedin.com/in/shazalia-moawia-wadidi/");
            },
          ),
        ],
      ),
    );
  }

  _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'shazaliawd@gmail.com',
      queryParameters: {
        'subject': 'Opportunity',
        'body': 'Hi\n',
      },
    );

    if (!await canLaunchUrl(emailLaunchUri)) {
      await launchUrl((emailLaunchUri));
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  _launchAnyUrl(String path) async {
    final Uri _url = Uri.parse(path);

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  _launchPhoneCall() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'tel',
      path: '+971-543-883-905',
    );

    if (!await canLaunchUrl(emailLaunchUri)) {
      await launchUrl((emailLaunchUri));
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
