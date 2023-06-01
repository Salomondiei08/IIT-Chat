import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iit_chat/screens/chat_screen.dart';

import '../utils/app_theme.dart';
import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Map<String, Widget>> _pages = [];
  // int _selectedPageIndex = 0;

  // void _selectPage(int index) {
  //   setState(() {
  //     _selectedPageIndex = index;
  //   });
  // }

  @override
  void initState() {
    _pages = [
      {"page": ChatScreen()},
      {"page": ChatScreen()},
      {"page": ChatScreen()},
      {"page": InfoScreen()},
    ];
    super.initState();
  }

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _pages[currentIndex]["page"],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: _width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: _pages.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: _width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: _width * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? _width * .12 : 0,
                      width: index == currentIndex ? _width * .2125 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? AppTheme.redColor.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: _width * .2125,
                  alignment: Alignment.center,
                  child: Icon(
                    listOfIcons[index],
                    size: _width * .076,
                    color: index == currentIndex
                        ? AppTheme.redColor
                        : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.message,
    Icons.person,
    Icons.calendar_month,
    Icons.account_box,
  ];
}
