import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/Data/Post.dart';
import 'package:instagram_clone/Data/Story.dart';
import 'package:instagram_clone/Widgets/BottomNavigatorCustom.dart';
import 'package:instagram_clone/Widgets/PostHomeItem.dart';
import 'package:instagram_clone/Widgets/StoryItem.dart';

class HomePage extends StatefulWidget 
{
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
{

  void _onHorizontalUpdate( DragUpdateDetails details ){

      if( details.primaryDelta < -6 ){
        Navigator.of(context).pushNamed('message');
      }

  }

  @override
  Widget build(BuildContext context) 
  {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle( statusBarColor: Colors.white ));
    
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Image.asset('Assets/logo-letra.png', height: 40),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
              SvgPicture.asset('Assets/add.svg', color: Colors.black, height: 22),
              SizedBox(width: 7),
              IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.black,),
                onPressed: (){}
              ),
              SizedBox(width: 4),
              SvgPicture.asset('Assets/message_icon.svg', color: Colors.black, height: 27),
              SizedBox(width: 15)
          ],
        ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: GestureDetector(
          onHorizontalDragUpdate: (details){
              _onHorizontalUpdate(details);
          },
          child: Column(
            children: [

                //Story
                SizedBox(height:15),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image: NetworkImage(profile), fit: BoxFit.cover)
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 19,
                                      width: 19,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                      ),
                                      child: Icon(Icons.add_circle, color: Color(0xFF0398F4), size: 22),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                            SizedBox(height: 9),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text('Your Story', style: TextStyle(fontSize: 13.0)),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: List.generate(story.length, (index) 
                          => StoryItem(name: story[index].name, image: story[index].image )
                        ),
                      )
                    ],
                  ),
                ),

                Divider(color: Colors.grey.withOpacity(0.3)),

                Column(
                  children: List.generate(postHome.length, (index) 
                    => PostHomeItem(
                      profileImg: postHome[index].postImagen,
                      name: postHome[index].name,
                      postImagen: postHome[index].postImagen,
                      isLove: postHome[index].isLove,
                      likes: postHome[index].likes,
                      commentNumber: postHome[index].commentNumber,
                      timeAgo: postHome[index].timeAgo,
                      caption: postHome[index].caption,
                    )),
                )

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarCustom(index: 1,)
    );
  }
}