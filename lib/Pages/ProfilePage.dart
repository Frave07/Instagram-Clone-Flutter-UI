import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/Data/CategorySearch.dart';
import 'package:instagram_clone/Data/Story.dart';
import 'package:instagram_clone/Helpers/ModalAccount.dart';
import 'package:instagram_clone/Helpers/ModalAdd.dart';
import 'package:instagram_clone/Widgets/BottomNavigatorCustom.dart';
import 'package:instagram_clone/Widgets/StoryTrue.dart';

class ProfilePage extends StatefulWidget 
{

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> 
{
  
  int indexPagesProfile = 0;

  @override
  Widget build(BuildContext context) 
  {
    var size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            Icon(Icons.lock_open_sharp, color: Colors.black, size: 18),
            GestureDetector(
              onTap: () => showModalAccount(context),
              child: Text('Frave_Programmer', style: TextStyle(color: Colors.black, fontSize: 20))
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 20),
          ],
        ),
        actions: [
            GestureDetector(
              onTap: () => showModalAdd(context),
              child: SvgPicture.asset('Assets/add.svg', color: Colors.black, height: 22)
            ),
           SizedBox(width: 25.0),
           SvgPicture.asset('Assets/menu.svg', color: Colors.black, height: 22),           
           SizedBox(width: 20.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StoryTrue(sizeCircle: 85, sizeCircleImage: 75, colorPrimary:  Color(0xFF9B2282), colorSecundary: Color(0xFFEEA863), image: profile),
                  Column(children: [
                    Text('520', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Posts'),
                  ]),
                  Column(children: [
                    Text('520,242', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Followers'),
                  ]),
                  Column(children: [
                    Text('1515', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Following'),
                  ]),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.0),
                  Text('Frave Programmer'),
                  SizedBox(height: 2.0),
                  Text('Fullstack Developer'),
                  SizedBox(height: 2.0),
                  Text('#Flutter', style: TextStyle(color: Colors.blue[700])),
                  SizedBox(height: 2.0),
                  Text('#Laravel', style: TextStyle(color: Colors.blue[700])),
                  SizedBox(height: 2.0),
                  Text('#NodeJs', style: TextStyle(color: Colors.blue[700])),
                  SizedBox(height: 2.0),
                  Text('#Mysql', style: TextStyle(color: Colors.blue[700])),
                ],
              ),
            ),

            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('Edit Profile')),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Story Hightlights', style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.keyboard_arrow_up_rounded)
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Keep your favorite stories on your profile', style: TextStyle(fontSize: 14.0)),
            ),

            SizedBox(height: 15.0),
            _StoryHightLight(),
            SizedBox(height: 15.0),


            Row(
              children: [
                Container(
                  height: 45,
                  width: (size.width * 0.5),
                  child: IconButton(
                     splashRadius: 23,
                    icon: Icon(Icons.grid_view, size: 28, color: indexPagesProfile == 0 ? Colors.black : Colors.grey),
                    onPressed: (){ setState(() {  indexPagesProfile = 0; }); },
                  ),
                ),
                Container(
                  height: 45,
                  width: (size.width * 0.5),
                  child: IconButton(
                    splashRadius: 23,
                    icon: Icon(Icons.person_pin_outlined, size: 28, color: indexPagesProfile == 1 ? Colors.black : Colors.grey),
                    onPressed: (){ setState(() {  indexPagesProfile = 1; }); },
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 1,
                      width: (size.width * 0.5),
                      decoration: BoxDecoration( color: indexPagesProfile == 0 ? Colors.black : Colors.transparent),
                    ),
                    Container(
                      height: 1,
                      width: (size.width * 0.5),
                      decoration: BoxDecoration( color: indexPagesProfile == 1 ? Colors.black : Colors.transparent),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: size.width,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.8)),
                )
              ],
            ),

            SizedBox(height: 5),
            IndexedStack(
              index: indexPagesProfile,
              children: [
                getImages(size),
                getTagPeople()
              ],
            )

            
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarCustom(index: 5),
    );
  }

  Widget getImages(size){

    return  Wrap(
      spacing: 1,
      runSpacing: 1,
      children: List.generate(searchImages.length, (index) 
        => Container(
          height: (size.height - 4) / 4,
          width: (size.width - 3) / 3,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(searchImages[index]), fit: BoxFit.cover)
          ),
        )
      ),
    );
  }

  Widget getTagPeople(){

    return Center(
      child: Column(
        children: [
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all()
            ),
            child: Icon(Icons.person_pin_outlined, size: 85)
          ),
          SizedBox(height: 10.0),
          Text('Photos and Videos of You', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 15.0),
          Text('When  people tag you in photo and videos, they\'ll '),
          Text('appear here.')

        ],
      ),
    );
  }
  
}



class _StoryHightLight extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all()
            ),
            child: Icon(Icons.add),
          ),
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEFEFEF)
            ),
          ),
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEFEFEF)
            ),
          ),
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEFEFEF)
            ),
          )
        ],
      ),
    );
  }
}

