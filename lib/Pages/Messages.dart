import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/Data/CategorySearch.dart';
import 'package:instagram_clone/Widgets/Search.dart';


class MessagesPage extends StatefulWidget
{
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> 
{
  int indexChats = 0;

  @override
  Widget build(BuildContext context)
  {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('Assets/flecha-izquierda.svg', height: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Frave_Programmer', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam_outlined , color: Colors.black, size: 35),
            onPressed: (){}
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.edit, color: Colors.black,),
            onPressed: (){}
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

              Row(
                children: [
                  Container(
                    height: 45,
                    width: (size.width * 0.5),
                    child: InkWell(
                      child: Center(
                        child: Text('Chats', style: TextStyle(color: indexChats == 0 ? Colors.black : Colors.grey )),
                      ),
                      onTap: (){ setState(() { indexChats = 0; }); },
                    ),
                  ),
                  Container(
                    height: 45,
                    width: (size.width * 0.5),
                    child: InkWell(
                      child: Center(
                        child: Text('Rooms', style: TextStyle(color: indexChats == 1 ? Colors.black : Colors.grey)),
                      ),
                      onTap: (){ setState(() { indexChats = 1; }); },
                    ),
                  ),
                ],
              ),
              Container(
                height: 1,
                width: size.width,
                decoration: BoxDecoration(color: Colors.grey),
              ),

              IndexedStack(
                index: indexChats,
                children: [
                  getChats(size),
                  getRooms()
                ],
              )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt_outlined, size: 25,color: Color(0xff0385DC)),
            SizedBox(width: 10.0),
            Text('Camara', style: TextStyle(fontSize: 17, color: Color(0xff0385DC)))
          ],
        ),
      ),
    );
  }

  Widget getChats(size ){

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

            SizedBox(height: 15.0),
            
            SearchTextField(size: size, isSize: false),

            SizedBox(height: 15.0),
            Text('Messages'),
            SizedBox(height: 10.0),

            Column(
              children: List.generate(searchImages.length, (index) 
                => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 6.0, top: 6.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: NetworkImage(searchImages[index]), fit: BoxFit.cover)
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Frave', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text('This a message', style: TextStyle(color: Colors.grey))
                          ],
                        )
                      ],
                    ),

                    IconButton(
                      icon: Icon(Icons.camera_alt_outlined, size: 28),
                      onPressed: (){}
                    )
                  ],
                )
              ),
            )

        ],
      ),
    );

  }

  Widget getRooms(){

    return Center(
      child: Column(
        children: [

          Icon(Icons.videocam_outlined, size: 120, color: Color(0xFFE62755)),
          Text('Video chat With Anyone', style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.0),
          Text('Invite up to 50 people to join a video chat'),
          SizedBox(height: 10.0),

          InkWell(
            child: Container(
              height: 45,
              width: 280,
              decoration: BoxDecoration(
                color: Color(0xff0385DC),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Center(child: Text('Create', style:  TextStyle(fontSize: 17, color: Colors.white)))
            ),
            onTap: (){},
          )
        ],
      ),
    );

  }

}