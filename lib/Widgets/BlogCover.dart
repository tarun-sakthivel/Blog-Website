import 'package:flutter/material.dart';

class BlogCover extends StatefulWidget {
  const BlogCover({super.key});

  @override
  State<BlogCover> createState() => _BlogCoverState();
}

class _BlogCoverState extends State<BlogCover> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),border: Border.all(color: Colors.black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      ),
    );
  }
}
