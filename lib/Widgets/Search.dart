import 'package:flutter/material.dart';


class SearchTextField extends StatelessWidget 
{

  final String text;
  final Size size;
  final bool isSize;
  final double tamano;

  const SearchTextField({ this.text = 'Search', this.size, @required this.isSize, this.tamano });
  

  @override
  Widget build(BuildContext context) 
  {  
    return Container(
      height: 40,
      width: !isSize ? size.width : size.width - tamano,
      decoration: BoxDecoration(
        color: Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16)
        ),
        style: TextStyle(color: Color(0xFF262626).withOpacity(0.8)),
        cursorColor: Color(0xFFEEA863),
      ),
    );
  }
}