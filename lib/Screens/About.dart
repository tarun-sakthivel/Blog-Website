import 'package:bolg_website/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 550
        ? Column(
            children: [
              Flexible(flex: 2, child: Image.asset('assets/images/pf1.png')),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TARUN",
                          style: korangetextStyle.copyWith(fontSize: 42),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "SAKTHIVEL",
                            style: korangetextStyle.copyWith(fontSize: 42),
                          ),
                        ),
                        Text(
                          "A passionate 21 year old boy, trying to bring some positive imapct to the world.",
                          style: knormaltextStyle.copyWith(
                              fontSize: 24, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Flutter\n Developer",
                            style: knormaltextStyle.copyWith(
                                fontSize: 20, color: Colors.black)),
                        Text("UI UX\n Developer",
                            style: knormaltextStyle.copyWith(
                                fontSize: 20, color: Colors.black)),
                        Text("Public\n Speaker",
                            style: knormaltextStyle.copyWith(
                                fontSize: 20, color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildTags([
                      'Instagram',
                      'LinkedIn',
                      'GitHub',
                      'Email',
                      'Paper'
                    ], [
                      "assets/images/instagram.png",
                      "assets/images/LinkedIn.png",
                      "assets/images/GitHub.png",
                      "assets/images/mail.png",
                      "assets/images/mail.png"
                    ], [
                      "https://www.instagram.com/__tarun_.s/?utm_source=qr#",
                      "https://www.linkedin.com/in/tarun-sakthivel-0b904a254/",
                      "https://github.com/tarun-sakthivel",
                      "mailto:tarunofficial077@gmail.com",
                      "https://ieeexplore.ieee.org/document/10725931"
                    ], screenWidth),
                  ],
                ),
              ),
            ],
          )
        : Row(
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TARUN",
                          style: korangetextStyle.copyWith(fontSize: 42),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 10),
                          child: Text(
                            "SAKTHIVEL",
                            style: korangetextStyle.copyWith(fontSize: 42),
                          ),
                        ),
                        Text(
                          " A 21-year-old tech enthusiast who loves building sleek Flutter apps and designing clean, user-friendly interfaces. I’m passionate about using tech to create a positive impact in the world. When I’m not coding, you’ll probably find me playing or watching football or vibing to music.",
                          style: knormaltextStyle.copyWith(
                              fontSize: screenWidth * 0.018,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    // SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Flutter\n Developer",
                            style: knormaltextStyle.copyWith(
                                fontSize: 20, color: Colors.black)),
                        Text("UI UX\n Developer",
                            style: knormaltextStyle.copyWith(
                                fontSize: 20, color: Colors.black)),
                        Text("Public\n Speaker",
                            style: knormaltextStyle.copyWith(
                                fontSize: 20, color: Colors.black)),
                      ],
                    ),
                    buildTags([
                      'Instagram',
                      'LinkedIn',
                      'GitHub',
                      'Email',
                      'Paper'
                    ], [
                      "assets/images/instagram.png",
                      "assets/images/LinkedIn.png",
                      "assets/images/GitHub.png",
                      "assets/images/mail.png",
                      "assets/images/mail.png"
                    ], [
                      "https://www.instagram.com/__tarun_.s/?utm_source=qr#",
                      "https://www.linkedin.com/in/tarun-sakthivel-0b904a254/",
                      "https://github.com/tarun-sakthivel",
                      "mailto:tarunofficial077@gmail.com",
                      "https://ieeexplore.ieee.org/document/10725931"
                    ], screenWidth),
                  ],
                ),
              ),
              Flexible(flex: 1, child: Image.asset('assets/images/pf1.png')),
            ],
          );
  }
}

Widget buildTags(
  List<String> skills,
  List<String> images,
  List<String> urls, // Add URLs here
  double screenWidth,
) {
  return Wrap(
    spacing: screenWidth < 900 ? 7.0 : 10.0,
    runSpacing: screenWidth < 900 ? 7.0 : 10.0,
    children: skills.asMap().entries.map((entry) {
      final index = entry.key;
      final skill = entry.value;
      final imageName = images[index];
      final url = urls[index];

      return GestureDetector(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 600 ? 3.0 : 12.0,
            vertical: screenWidth < 600 ? 2.0 : 6.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenWidth < 600 ? 8 : 10),
            border:
                Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imageName,
                height: screenWidth < 600 ? 15 : 18,
                width: screenWidth < 600 ? 15 : 18,
                color: Colors.black,
                fit: BoxFit.contain,
              ),
              SizedBox(width: screenWidth < 600 ? 5 : 8),
              Text(
                skill,
                style: knormaltextStyle.copyWith(
                  fontWeight:
                      screenWidth < 600 ? FontWeight.w700 : FontWeight.w500,
                  fontSize: screenWidth < 600 ? 15 : screenWidth * 0.015,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList(),
  );
}
