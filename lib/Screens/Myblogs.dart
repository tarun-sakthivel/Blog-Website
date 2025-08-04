import 'package:bolg_website/Bloc/bloc/blog_fetch_bloc.dart';
import 'package:bolg_website/Screens/blogDisplay.dart';

import 'package:bolg_website/constants/text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // Ensure path is correct

class Myblogs extends StatefulWidget {
  const Myblogs({super.key});

  @override
  State<Myblogs> createState() => _MyblogsState();
}

class _MyblogsState extends State<Myblogs> {
  // 🧪 Dummy blog list
  // final List<BlogModel> blogs = [
  //   BlogModel(
  //     id: '1',
  //     title: 'Flutter 3.0 is Here!',
  //     content:
  //         'Flutter 3.0 brings a lot of exciting features including web support The little prince\'s personality shone during the pageantry there, from flashing a genuine grin (showing off his missing front teeth) in the carriage procession and making sure to get the last wave when the royals departed the Buckingham Palace balcony.',
  //     imageUrl: 'https://source.unsplash.com/random/800x600?flutter',
  //     createdAt: DateTime.now().subtract(Duration(days: 1)),
  //   ),
  //   BlogModel(
  //     id: '2',
  //     title: 'Dart Tips & Tricks',
  //     content:
  //         'Explore advanced Dart features like extensions, mixins, and more...',
  //     imageUrl: 'https://source.unsplash.com/random/800x600?code',
  //     createdAt: DateTime.now().subtract(Duration(days: 2)),
  //   ),
  //   BlogModel(
  //     id: '3',
  //     title: 'UI Design Principles',
  //     content:
  //         'Learn what makes a good UI and how to build one with Flutter...',
  //     imageUrl: 'https://source.unsplash.com/random/800x600?ui',
  //     createdAt: DateTime.now().subtract(Duration(days: 3)),
  //   ),
  //   BlogModel(
  //     id: '4',
  //     title: 'Build Your Portfolio',
  //     content: 'Want to get hired? Start building your portfolio today...',
  //     imageUrl: 'https://source.unsplash.com/random/800x600?portfolio',
  //     createdAt: DateTime.now().subtract(Duration(days: 4)),
  //   ),
  //   BlogModel(
  //     id: '5',
  //     title: 'State Management Showdown',
  //     content: 'Bloc vs Provider vs Riverpod - which one should you use?',
  //     imageUrl: 'https://source.unsplash.com/random/800x600?technology',
  //     createdAt: DateTime.now().subtract(Duration(days: 5)),
  //   ),
  // ];
  // @override
  // void initState() {
  //   super.initState();
  //   context
  //       .read<BlogFetchBloc>()
  //       .add(LoadBlogs()); // 🟢 manually dispatch event
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double smallfont = screenWidth * 0.01;
    double largefont = screenWidth * 0.02;
    double boxHeight = screenWidth * 0.32;
    return BlocBuilder<BlogFetchBloc, BlogFetchState>(
        builder: (context, state) {
      if (state is BlogFetchLoaded) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.01, vertical: 20),
          child: SizedBox(
            height: boxHeight,
            width: double.infinity,
            child: screenWidth < 600
                ? GridView.builder(
                    padding: EdgeInsets.all(20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 3 : 1,
                      crossAxisSpacing: screenWidth < 600 ? 10 : 20,
                      mainAxisSpacing: screenWidth < 600 ? 10 : 20,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: state.blogs.length,
                    itemBuilder: (context, index) {
                      final blog = state.blogs[index];
                      return GestureDetector(
                        onTap: () {
                          // Placeholder for navigation
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Blogdisplay(blog: state.blogs[index]),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: kOrangeColor),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: Image.network(
                                    blog.imageUrl,
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      height: 180,
                                      color: Colors.grey[300],
                                      child: Icon(Icons.broken_image, size: 48),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${blog.createdAt.toLocal().toString().split(' ')[0]}  •  2 min read',
                                      style: knormaltextStyle.copyWith(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      blog.title,
                                      style: knormaltextStyle.copyWith(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      blog.content.length > 100
                                          ? blog.content.substring(0, 100) +
                                              '...'
                                          : blog.content,
                                      style: knormaltextStyle.copyWith(
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : MasonryGridView.count(
                    crossAxisCount: screenWidth < 1000 ? 3 : 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    itemCount: state.blogs.length,
                    itemBuilder: (context, index) {
                      final blog = state.blogs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Blogdisplay(blog: state.blogs[index]),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              //border: Border.all(color: kOrangeColor),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                child: Image.network(
                                  blog.imageUrl,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    height: 180,
                                    color: Colors.grey[300],
                                    child: Icon(Icons.broken_image, size: 48),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${blog.createdAt.toLocal().toString().split(' ')[0]}  •  2 min read',
                                      style: knormaltextStyle.copyWith(
                                          color: Colors.black,
                                          fontSize: smallfont,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      blog.title,
                                      style: knormaltextStyle.copyWith(
                                          color: Colors.black,
                                          fontSize: largefont,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      blog.content.length > 100
                                          ? blog.content.substring(0, 100) +
                                              '...'
                                          : blog.content,
                                      style: knormaltextStyle.copyWith(
                                          fontSize: smallfont * 1.2),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      } else if (state is BlogFetchLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is BlogFetchError) {
        return Text(state.message);
      } else
        return Text("data");
    });
  }
}
