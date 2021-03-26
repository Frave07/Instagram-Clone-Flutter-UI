import 'package:flutter/material.dart';

class StoryTrue extends StatelessWidget
{
  final double sizeCircle;
  final double sizeCircleImage;
  final Color colorPrimary;
  final Color colorSecundary;
  final String image;

  const StoryTrue({
    this.sizeCircle,
    this.sizeCircleImage,
    this.colorPrimary,
    this.colorSecundary,
    this.image
  });

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      height: sizeCircle,
      width: sizeCircle,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorPrimary,
            colorSecundary
          ]
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Container(
          height: sizeCircleImage,
          width: sizeCircleImage,
          decoration: BoxDecoration(
            border: Border.all(width: 3.0, color: Colors.white),
            shape: BoxShape.circle,
            image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}