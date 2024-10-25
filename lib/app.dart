import 'package:flutter/material.dart';
import 'package:uselessproject/comment.dart';
import 'package:uselessproject/review.dart';

final List<Widget> tabs = [const Comment(), const Review()];

class WholeApp extends StatefulWidget {
  const WholeApp({super.key});

  @override
  State<WholeApp> createState() => _WholeAppState();
}

class _WholeAppState extends State<WholeApp> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
      home: Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: tabs[currentTabIndex],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.blueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: currentTabIndex,
            onTap: (index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.comment_outlined),
                label: "Comments",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.reviews_outlined),
                label: "Ratings",
              ),
            ],
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
