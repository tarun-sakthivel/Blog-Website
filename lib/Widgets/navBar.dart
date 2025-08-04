import 'package:bolg_website/Screens/CreateBolg.dart';

import 'package:bolg_website/constants/text.dart';
import 'package:bolg_website/firebasefunctions.dart';

import 'package:flutter/material.dart';

class WebNavbar extends StatelessWidget {
  final ValueNotifier<int> selectedIndex;
  final screenWidth;
  const WebNavbar(
      {super.key, required this.selectedIndex, required this.screenWidth});
  void _showdialog(BuildContext context) {
    TextEditingController textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Hey Stalker!!"),
        actions: [
          Center(
            child: Text(
                "U can add ur blog if you crack the passcode.Pswd is in homepage."),
          ),
          TextField(
            controller: textController,
          ),
          TextButton(
            onPressed: () => textController.text ==
                    "look into the forest traditional ride is waiting for you"
                ? Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateBlog()))
                : Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _subscribe(BuildContext context) {
    TextEditingController emailText = TextEditingController();
    TextEditingController nameText = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
            "To get notified when new blog is added, please enter your details."),
        actions: [
          Center(child: Text("Name:")),
          TextField(
            controller: nameText,
          ),
          Center(child: Text("E-mail:")),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: emailText,
          ),
          TextButton(
            onPressed: () {
              if (nameText.text != "" && emailText.text != "")
                FirebaseService().addSubscriber(nameText.text, emailText.text);
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Subscribed with ${emailText.text}")),
              );
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      color: Colors.white,
      child: screenWidth < 550
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: screenWidth * 0.02),
                _buildNavItem("Home", 0),
                SizedBox(width: screenWidth * 0.02),
                _buildNavItem("My Blogs", 1),
                SizedBox(width: screenWidth * 0.02),
                _buildNavItem("About", 2),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          _showdialog(context);
                        },
                        child: Image.asset(
                          'assets/images/TS_Logo1.png',
                          height: screenWidth * 0.022,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        'Verse Of Me',
                        style: knormaltextStyle.copyWith(
                          fontSize: screenWidth * 0.02,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _subscribe(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Get notified",
                                  style: knormaltextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: screenWidth * 0.01,
                                  )),
                              Icon(Icons.notification_add,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    _buildNavItem("Home", 0),
                    SizedBox(width: screenWidth * 0.02),
                    _buildNavItem("My Blogs", 1),
                    SizedBox(width: screenWidth * 0.02),
                    _buildNavItem("About", 2),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndex,
      builder: (context, currentIndex, _) {
        return InkWell(
          onTap: () => selectedIndex.value = index,
          child: Text(
            title,
            style: knormaltextStyle.copyWith(
              color: index == currentIndex ? Colors.orange : Colors.black,
              fontWeight:
                  currentIndex == index ? FontWeight.bold : FontWeight.w500,
              fontSize: 24,
            ),
          ),
        );
      },
    );
  }
}
