import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          screenWidth<550? 
          Align(
            alignment: Alignment(0, -1),
            child: Image.asset(
              'assets/images/fm2.png',
            ),
          ) : 
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
