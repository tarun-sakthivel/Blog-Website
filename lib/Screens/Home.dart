import 'package:bolg_website/constants/text.dart';
import 'package:bolg_website/firebasefunctions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              if (nameText.text != "" && emailText.text != "") {
                FirebaseService().addSubscriber(nameText.text, emailText.text);
              }
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          screenWidth < 600
              ? Align(
                  alignment: Alignment(0, -1),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/fm2.png',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          _subscribe(context);
                        },
                        child: Container(
                          width: 160,
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
                                      fontSize: 16,
                                    )),
                                Icon(Icons.notification_add,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Align(
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
