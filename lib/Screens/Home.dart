import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, -1),
            child: Image.asset(
              'assets/images/fm1.png',
            ),
          )
        ],
      ),
    );
  }
}
