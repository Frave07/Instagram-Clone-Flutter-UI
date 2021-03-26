import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/Data/Story.dart';


showDialogCustomSearch (BuildContext context, String image){

  showDialog(
    context: context,
    builder: (_) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(profile), fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(width: 8),
                    Text('Frave_Programmer', style: TextStyle( fontSize: 16, color: Colors.black))
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.favorite_border_outlined,  size: 30),
                  Icon(Icons.account_circle_outlined, size: 30),
                  SvgPicture.asset('Assets/message_icon.svg', height:30, color: Colors.black,),
                  Icon(Icons.more_vert,  size: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    )
  );

}