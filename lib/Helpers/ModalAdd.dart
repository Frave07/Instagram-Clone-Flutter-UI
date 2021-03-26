import 'package:flutter/material.dart';


showModalAdd (BuildContext context){

    showDialog(
      barrierColor: Color(0xFF7F7F7F).withOpacity(0.35),
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            child: Material(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      child: Container(
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xffC7C7C7)
                        ),
                      ),
                     ),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Create New', style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                  SizedBox(height: 15.0),
                  Divider(color: Colors.black12),

                  _CreateNews(icon: Icons.apps_outlined, text: 'Feed Post'),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Divider(),
                  ),

                  _CreateNews(icon: Icons.slow_motion_video_outlined, text: 'Story'),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Divider(),
                  ),

                  _CreateNews(icon: Icons.motion_photos_on_outlined, text: 'Story Highlight'),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Divider(),
                  ),

                  _CreateNews(icon: Icons.tv, text: 'IGTV Video'),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Divider(),
                  ),

                  _CreateNews(icon: Icons.movie_creation_outlined, text: 'Reel'),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Divider(),
                  ),

                  _CreateNews(icon: Icons.chrome_reader_mode_outlined, text: 'Guide'),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Divider(),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );

}

class _CreateNews extends StatelessWidget {

  final String text;
  final IconData icon;

  const _CreateNews({ this.text, this.icon });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Container(
          height: 50,
          child: Row(
            children: [
              Icon(icon, size: 26),
              SizedBox(width: 10.0),
              Text(text, style: TextStyle(fontSize: 16))
            ],
          ),
        ),
      ),
    );
  }
}