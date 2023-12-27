import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shaza/pages/about_app.dart';
import 'package:shaza/util/color.dart';
import 'package:shaza/widgets/phone_frame.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../pages/catch_screen.dart';
import '../pages/project_full_screen.dart';

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [ProfileHeader(), ProjectList(), 150.height],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_arrow, // Icon to toggle the Speed Dial
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.question_mark_outlined,
              color: Colors.blue,
              size: 25,
            ),
            label: 'About',
            labelStyle: const TextStyle(
              fontFamily: 'Cairo',
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutApp()));
            },
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.map,
              color: Colors.deepOrange,
              size: 25,
            ),
            label: 'Availability',
            labelStyle: const TextStyle(
              fontFamily: 'Cairo',
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CityMap()));
            },
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.video_camera_front,
              color: Colors.black87,
              size: 25,
            ),
            label: 'Meet',
            labelStyle: const TextStyle(
              fontFamily: 'Cairo',
            ),
            onTap: () {
              _launchAnyUrl("https://meet.google.com/nfy-wxkn-wsm");
            },
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.download,
              color: Colors.green,
              size: 25,
            ),
            label: 'CV',
            labelStyle: const TextStyle(
              fontFamily: 'Cairo',
            ),
            onTap: () {
              downloadFile(
                  'https://drive.google.com/u/0/uc?id=1yOSK3Xi33kRxodD0VsnwGDBvShV0VWUo&export=download'); // Replace with the file URL
            },
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.call,
              color: primaryColor,
              size: 25,
            ),
            label: 'Call',
            labelStyle: const TextStyle(
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
            labelStyle: const TextStyle(
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
            labelStyle: const TextStyle(
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
            labelStyle: const TextStyle(
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

  Future<void> downloadFile(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final directory = await getExternalStorageDirectory();
      final filePath =
          '${directory!.path}/Shazalia Resume.pdf'; // Define the file path

      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      // You can now use the downloaded file as needed
      print('File downloaded to: $filePath');
    } else {
      throw Exception('Failed to download file');
    }
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

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/shaza.png'),
          ),
          SizedBox(height: 10),
          Text(
            'Shazalia Moawia',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('Flutter Developer'),
          SizedBox(height: 14),
          Text(
              'Welcome to my Flutter developer portfolio! I am passionate about creating beautiful, functional, and responsive mobile and web applications using Flutter. Here, you will find a curated collection of my projects that demonstrate my skills and expertise.'),
        ],
      ),
    );
  }
}

class ProjectList extends StatelessWidget {
  final List<String> imageProjectOne = [
    'assets/projects/two/moeen_home.png',
    'assets/projects/two/moeen_home_2.png',
    'assets/projects/two/moeen_onboard.png',
    // Add more image paths as needed
  ];
  final List<String> imageProjectTwo = [
    'assets/projects/one/zain_home.png',
    'assets/projects/one/zain_home_2.jpg',
    'assets/projects/one/zain_add_content.jpg',
    // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    // You can populate this section with your projects
    return Column(
      children: [
        ProjectItem(
          title: 'Moeen Application',
          description: 'On Demand Service App',
          images: imageProjectOne,
          clientName: "Valkyrie Soulutions",
          appIcon: "assets/projects/two/moeen_icon.png",
        ),
        50.height,
        ProjectItem(
          title: 'Zain Application',
          description: 'Social Media App',
          images: imageProjectTwo,
          clientName: "GradBloc Company",
          appIcon: "assets/projects/two/moeen_icon.png",
        ),
        // Add more ProjectItems as needed
      ],
    );
  }
}

class ProjectItem extends StatefulWidget {
  final String title;
  final String description;
  final String clientName;
  final String appIcon;
  final List<String> images;

  ProjectItem(
      {required this.title,
      required this.description,
      required this.images,
      required this.clientName,
      required this.appIcon});

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  int _currentIndex = 0;
  _launchAnyUrl(String path) async {
    final Uri _url = Uri.parse(path);

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.appIcon,
                width: 25,
              ),
              Text(widget.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              InkWell(
                onTap: () {
                  if (widget.clientName.startsWith("V")) {
                    _launchAnyUrl("https://valkyriesolutions.co/");
                  } else if (widget.clientName.startsWith("G")) {
                    _launchAnyUrl("https://www.gbt.ae/");
                  }
                },
                child: Text("\n${widget.clientName}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                      decoration: TextDecoration.underline,
                    )),
              ),
            ],
          ),
          subtitle: Text(widget.description),
        ),

        const SizedBox(height: 20),
        CarouselSlider(
          options: CarouselOptions(
            height: 600.0, // Customize the height as needed
            enlargeCenterPage: true,
            autoPlay: false,
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            }, // Customize the aspect ratio as needed
          ),
          items: widget.images.map((imagePath) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        FullScreenImageScreen(imageUrl: imagePath)));
              },
              child: Builder(
                builder: (BuildContext context) {
                  return PhoneFrame(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
        20.height,
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.map((image) {
              int index = widget.images.indexOf(image);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                ),
              );
            }).toList()),
        // The rest of your fixed page content
      ],
    );
  }
}
