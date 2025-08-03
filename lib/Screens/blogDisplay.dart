import 'package:bolg_website/constants/text.dart';
import 'package:flutter/material.dart';
import '../Models/BlogModel.dart'; // adjust the path to your BlogModel

class Blogdisplay extends StatelessWidget {
  final BlogModel blog;

  const Blogdisplay({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          blog.title,
          style: knormaltextStyle,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (blog.imageUrl.isNotEmpty)
              Center(
                child: Image.network(
                  blog.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 20),
            Text(
              blog.title,
              style: knormaltextStyle.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              blog.content,
              style: knormaltextStyle.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
