import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/Data/CommentsPost.dart';
import 'package:instagram_clone/Data/Story.dart';
import 'package:instagram_clone/Widgets/CommentsItems.dart';

class CommentsPostPage extends StatelessWidget 
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Comments', style: TextStyle(color: Colors.black, fontSize: 20)),
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset('Assets/flecha-izquierda.svg', height: 28,),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('Assets/message_icon.svg', color: Colors.black, height: 28,),
            onPressed: (){}
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [

            ListView(
              // physics: BouncingScrollPhysics(),
              children: [

                Padding(
                  padding: EdgeInsets.only(left: 15.0, bottom: 10.0, top: 10.0),
                  child: Row(
                    children: [
                      Container(
                         height: 40,
                         width: 40,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           image: DecorationImage(image: NetworkImage(profile), fit: BoxFit.cover)
                         ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: 'Frave_Programmer ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    TextSpan(text: 'Fullstack Developer', style: TextStyle(color: Colors.black)),
                                  ]
                                )
                              ),
                              SizedBox(height: 5),
                              Text('12 h', style: TextStyle(color: Colors.grey, fontSize: 12))
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Divider(color: Colors.grey.withOpacity(0.6)),

                Column(
                  children: List.generate(commentPost.length, (index) 
                    => CommentsItems(
                      photo: commentPost[index].photo,
                      name: commentPost[index].name,
                      caption: commentPost[index].caption,
                      likes: commentPost[index].likes,
                      timeAgo: commentPost[index].timeAgo,
                      isStory: commentPost[index].isStory,
                    )
                  ),
                ),

                
              ]
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    children: [
                      Divider(),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: NetworkImage(profile), fit: BoxFit.cover)
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'comment as Frave_programmer...',
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            )
                          ),
                          TextButton(
                            child: Text('Post'),
                            onPressed: (){},
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            )

          ],
        ),
      ),
    );
  }
}