import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/Data/Story.dart';

class BottomNavigationBarCustom extends StatelessWidget
{
  final int index;

  const BottomNavigationBarCustom({ this.index });

 @override
 Widget build(BuildContext context)
 {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed('home'),
            child:  SvgPicture.asset( index == 1 ? 'Assets/home(1).svg' :'Assets/home.svg' , height: 27)
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed('search'),
            child: SvgPicture.asset( index == 2 ? 'Assets/lupa.svg' : 'Assets/loupe.svg', height: 27)
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('Assets/video.svg', height: 27)
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed('shop'),
            child: SvgPicture.asset( index == 4 ?  'Assets/bolso.svg' :'Assets/bolsa_a.svg', height: 27)
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed('profile'),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(profile), fit: BoxFit.cover)
              ),
            ),
          )

        ],
      ),
    );
  }
}