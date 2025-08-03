import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bolg_website/Screens/About.dart';
import 'package:bolg_website/Screens/Home.dart';
import 'package:bolg_website/Screens/Myblogs.dart';
import 'package:bolg_website/constants/text.dart';
import 'package:bolg_website/Bloc/bloc/blog_fetch_bloc.dart';

// class Maintree extends StatefulWidget {
//   const Maintree({super.key});

//   @override
//   State<Maintree> createState() => _MaintreeState();
// }

// class _MaintreeState extends State<Maintree> {
//   final ScrollController _scrollController = ScrollController();

//   final GlobalKey homeKey = GlobalKey();
//   final GlobalKey aboutKey = GlobalKey();
//   final GlobalKey myBlogs = GlobalKey();

//   Future<void> scrollToSection(GlobalKey key) async {
//     final context = key.currentContext;
//     if (context != null) {
//       await Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 500),
//         alignment: 0,
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     context.read<BlogFetchBloc>().add(LoadBlogs());
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           // ✅ Fixed Top Navigation Bar
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: screenWidth * 0.02,
//               vertical: screenWidth * 0.015,
//             ),
//             child: buildNavigationBar(screenWidth),
//           ),

//           // ✅ Scrollable Section
//           Expanded(
//             child: SingleChildScrollView(
//               controller: _scrollController,
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 children: [
//                   // Home Section

//                   Container(
//                     key: homeKey,
//                     width: double.infinity,
//                     child: const HomePage(),
//                   ),

//                   // About Section
//                   Container(
//                     key: myBlogs,
//                     width: double.infinity,
//                     child: const Myblogs(),
//                   ),

//                   // Skills Section
//                   Container(
//                     key: aboutKey,
//                     width: double.infinity,
//                     child: const About(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildNavigationBar(double screenWidth) {
//     final isSmall = screenWidth < 600;
//     final horizontalSpacing = isSmall ? 6.0 : 20.0;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         if (!isSmall)
//           Image.asset(
//             "assets/images/TS_Logo1.png",
//             height: screenWidth * 0.04,
//           ),
//         Expanded(
//           child: Container(
//             alignment: Alignment.center,
//             child: Wrap(
//               spacing: horizontalSpacing,
//               crossAxisAlignment: WrapCrossAlignment.center,
//               alignment: WrapAlignment.end,
//               children: [
//                 navButton('Home', () => scrollToSection(homeKey), screenWidth),
//                 navButton('About', () => scrollToSection(myBlogs), screenWidth),
//                 navButton(
//                     'Skills', () => scrollToSection(aboutKey), screenWidth),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget navButton(String label, VoidCallback onPressed, double screenWidth) {
//     return Padding(
//       padding: screenWidth < 500
//           ? const EdgeInsets.symmetric(horizontal: 0.5)
//           : const EdgeInsets.symmetric(horizontal: 12),
//       child: TextButton(
//         onPressed: onPressed,
//         child: Text(
//           label,
//           style: knormaltextStyle.copyWith(
//             color: const Color.fromARGB(255, 190, 190, 190),
//             fontSize:
//                 screenWidth < 500 ? screenWidth * 0.03 : (screenWidth * 0.02),
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:bolg_website/Screens/Home.dart';
import 'package:bolg_website/Screens/Myblogs.dart';
import 'package:bolg_website/Widgets/navBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bolg_website/Bloc/bloc/blog_fetch_bloc.dart';

class Maintree extends StatelessWidget {
  Maintree({super.key});

  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  final List<Widget> pages = [
    HomePage(),
    Myblogs(),
    Center(child: Text("About Page", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    // Dispatch the event to load blogs
    context.read<BlogFetchBloc>().add(LoadBlogs());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          WebNavbar(
            selectedIndex: selectedIndex,
          ),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (context, index, _) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: pages[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
