import 'package:bolg_website/constants/text.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
            ],
          ),
        ),
        Flexible(flex: 1, child: Image.asset('assets/images/pf1.png')),
      ],
    );
  }
}
