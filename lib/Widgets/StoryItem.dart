import 'package:flutter/material.dart';


class StoryItem extends StatelessWidget 
{
  final String name;
  final String image;

  const StoryItem({ this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF9B2282),
                  Color(0xFFEEA863)
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(3.0),
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 3.0, color: Colors.white),
                  image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(name, style: TextStyle(fontSize: 13.0)),
        ],
      ),
    );
  }
}