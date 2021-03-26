import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/Data/Story.dart';

class PostHomeItem extends StatelessWidget 
{
  final int id;
  final String name;
  final String profileImg;
  final String postImagen;
  final String caption;
  final bool isLove;
  final String commentNumber;
  final int likes;
  final String lastLike;
  final String timeAgo;
  final String likeBy;

  const PostHomeItem({
    this.id,
    this.name,
    this.profileImg,
    this.postImagen,
    this.caption,
    this.isLove,
    this.commentNumber,
    this.likes,
    this.lastLike,
    this.timeAgo,
    this.likeBy
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

          Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 10.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(profileImg), fit: BoxFit.cover) 
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(name)
                  ],
                ),
                Icon(Icons.more_vert)

              ],
            ),
          ),

          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(postImagen), fit: BoxFit.cover)
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 5.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                  Row(
                    children: [
                        IconButton(
                          icon: this.isLove 
                          ? Icon(Icons.favorite, color: Colors.red, size: 30) 
                          : Icon(Icons.favorite_outline_rounded, size: 30), 
                          onPressed: (){}
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed('CommentsPost'),
                          child: SvgPicture.asset('Assets/comment_icon.svg', color: Colors.black, height: 24)
                        ),
                        SizedBox(width: 10),
                        SvgPicture.asset('Assets/message_icon.svg', color: Colors.black, height: 26),
                    ],
                  ),
                  Icon(Icons.bookmark_outline_rounded, size: 30)

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('$likes likes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),

          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 4.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '$name', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
                  TextSpan(text: ' $caption',style: TextStyle(color: Colors.black54))
                ]
              )
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 7.0),
            child: Text('View all $commentNumber comments', style: TextStyle(fontSize: 13.5, color: Colors.grey)),
          ),

          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 3.0),
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
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'add a comment..',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.favorite_rounded, color: Colors.redAccent[700], size: 20),
                  SizedBox(width: 5),
                  Icon(Icons.star_half_outlined, color: Colors.yellowAccent[700], size: 20),
                  SizedBox(width: 5),
                  Icon(Icons.add_circle_outline_outlined, color: Colors.grey[300], size: 20),
                  SizedBox(width: 10),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
            child: Text('$timeAgo', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
      ],
    );
  }
}