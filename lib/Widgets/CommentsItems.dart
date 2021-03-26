import 'package:flutter/material.dart';
import 'package:instagram_clone/Widgets/StoryTrue.dart';

class CommentsItems extends StatelessWidget 
{

  final String photo;
  final String name;
  final String caption;
  final String timeAgo;
  final String likes;
  final bool isStory;

  const CommentsItems({
    this.photo,
    this.name,
    this.caption,
    this.timeAgo,
    this.likes,
    this.isStory
  });


  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        
        Row(
          children: [

            isStory
            ? Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
              child: StoryTrue(
                sizeCircle: 48,
                sizeCircleImage: 40,
                colorPrimary: Color(0xFF9B2282),
                colorSecundary: Color(0xFFEEA863),
                image: photo,
              ),
            )
            : Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 15.0, top: 5.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(photo), fit: BoxFit.cover)
                ),
              ),
            ),


            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        TextSpan(text: ' $caption', style: TextStyle(color: Colors.black)),
                      ]
                    ), 
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(timeAgo, style: TextStyle(color: Colors.grey, fontSize: 12)),
                      SizedBox(width: 15),
                      Text('Ripley', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
                  

          ],
        ),
        
      ],

    );
  }
}