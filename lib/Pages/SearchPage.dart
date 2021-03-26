import 'package:flutter/material.dart';
import 'package:instagram_clone/Data/CategorySearch.dart';
import 'package:instagram_clone/Helpers/ModalSearch.dart';
import 'package:instagram_clone/Widgets/BottomNavigatorCustom.dart';
import 'package:instagram_clone/Widgets/Search.dart';

class SearchPage extends StatelessWidget 
{

  @override
  Widget build(BuildContext context) 
  {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    
                    SearchTextField(isSize: true, tamano: 80, size: size),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.center_focus_weak_rounded, size: 30),
                      onPressed: (){}
                    )
                  ],
                ),
              )
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
              children: List.generate(searchImages.length, (index) 
                => GestureDetector(
                    onLongPress: () => showDialogCustomSearch(context, searchImages[index]),
                    child: Container(
                      height: (size.height - 4) / 4,
                      width: (size.width - 3) / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(searchImages[index]), fit: BoxFit.cover)
                      ),
                    ),
                )
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarCustom(index: 2,)
    );
  }
}