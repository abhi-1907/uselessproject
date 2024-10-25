import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: ListView.separated(
        itemBuilder:(ctx,index){
         return ListTile(
          title: Text("name"),
          subtitle: Text("newname"),
         );},
         separatorBuilder: (ctx,index){
          return SizedBox(height:10);
      
        },
        itemCount: 100,
        
      ),
    );
  }
}