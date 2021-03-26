import 'package:flutter/material.dart';

import 'package:instagram_clone/Pages/HomePage.dart';
import 'package:instagram_clone/Pages/Comments.dart';
import 'package:instagram_clone/Pages/Messages.dart';
import 'package:instagram_clone/Pages/ProfilePage.dart';
import 'package:instagram_clone/Pages/SearchPage.dart';
import 'package:instagram_clone/Pages/ShopPage.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      initialRoute: 'home',
      routes: {
        'home' : (_) => HomePage(),
        'CommentsPost' : (_) => CommentsPostPage(),
        'search'  : (_) => SearchPage(),
        'profile' : (_) => ProfilePage(),
        'message' : (_) => MessagesPage(),
        'shop' : (_) => ShopPage(),
      },
      
    );
  }
}