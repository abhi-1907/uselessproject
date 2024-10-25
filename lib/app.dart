import 'package:flutter/material.dart';
import 'package:uselessproject/comment.dart';
import 'package:uselessproject/review.dart';
final Tabs=[Comment(),Review(),];
int currentTabIndex=0;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Tabs=[const Comment(),const Review(),];
  int currentTabIndex=0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Tabs[currentTabIndex],
        bottomNavigationBar:
          BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (currentIndex){
              currentTabIndex=currentIndex;
              setState(() {}
              );
              },
            items: const [

                BottomNavigationBarItem(
                  icon: Icon(Icons.comment_outlined),
                  label: "Comments"),
                BottomNavigationBarItem(
                icon: Icon(Icons.reviews_outlined),
                label:"Ratings"),
            ],
            backgroundColor: const Color.fromARGB(255, 103, 6, 121),
            selectedItemColor: Colors.white,
            unselectedItemColor: Color.fromARGB(255, 255, 254, 254),
      )
      ),
    );
  }
}