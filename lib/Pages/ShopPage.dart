import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/Data/CategorySearch.dart';
import 'package:instagram_clone/Data/ShopData.dart';
import 'package:instagram_clone/Widgets/BottomNavigatorCustom.dart';
import 'package:instagram_clone/Widgets/Search.dart';

class ShopPage extends StatelessWidget 
{

  @override
  Widget build(BuildContext context)
  {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Shop', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.wysiwyg, color: Colors.black, size: 30),
            onPressed: (){}
          ),
          IconButton(
            icon: SvgPicture.asset('Assets/menu.svg', height: 25),
            onPressed: (){}
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: SearchTextField(isSize: false, text: 'Search Shops', size: size,),
            ),

            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: List.generate(categoriesSearch.length, (index) 
                    => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 7.0, top: 7.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(categoriesSearch[index], style: TextStyle(color: Colors.black)),
                      ),
                    )
                  ),
                ),
              ),
            ),

            Wrap(
              spacing: 1,
              runSpacing: 1,
              children: List.generate(shopData.length, (index) 
                => Container(
                  height: (size.height - 4) / 4,
                  width: (size.width - 2) / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(image: NetworkImage(shopData[index].image), fit: BoxFit.cover)
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(shopData[index].name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                  ),
                )
              ),
            )
            

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarCustom(index: 4),

    );
  }
}