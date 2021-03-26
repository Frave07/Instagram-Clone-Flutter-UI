import 'package:flutter/material.dart';
import 'package:instagram_clone/Data/Story.dart';


showModalAccount (BuildContext context){

    showDialog(
      barrierColor: Color(0xFF7F7F7F).withOpacity(0.35),
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            child: Padding(
              padding: EdgeInsets.only(top:8.0, left: 15.0, right: 15.0),
              child: Material(
                color: Colors.white,
                child: Column(
                  children: [
                     Align(
                       child: Container(
                         height: 5,
                         width: 40,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30.0),
                           color: Color(0xffC7C7C7)
                         ),
                       ),
                     ),
                     SizedBox(height: 15.0),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                              Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: NetworkImage(profile), fit: BoxFit.cover)
                                ),
                              ),
                              SizedBox(width: 15.0 ),
                              Text('Frave_Programmer', style: TextStyle(color: Colors.black, fontSize: 15.0, decoration: TextDecoration.none))
                           ],
                         ),
                         Container(
                           height: 30,
                           width: 30,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             color: Color(0xFF0385DC)
                           ),
                           child: Padding(
                             padding: EdgeInsets.all(10.0),
                             child: Container(
                               width: 25,
                               height: 25,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.white
                               ),
                             ),
                           ),
                         )
                       ],
                     ),

                     SizedBox(height: 15.0 ),

                      Row(
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
                          SizedBox(width: 15.0 ),
                          Text('add Account', style: TextStyle(color: Colors.black, fontSize: 15.0, decoration: TextDecoration.none))
                        ],
                      ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

}