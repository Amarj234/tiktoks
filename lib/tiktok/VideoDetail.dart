import 'video.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user.dart';
class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key, required this.video}) : super(key: key);
final Video video;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "@${video.posteBy.username}",style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 15,
            color: Colors.white,fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(
            height: 8,

          ),
ExtendedText(video.caption,
   style: Theme.of(context).textTheme.bodyText1!.copyWith(
       fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold,

   ),

),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                CupertinoIcons.music_note_2,
                size: 15,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width/2,
                child:Text("${video.audioName}",style: TextStyle(
                  color: Colors.white,
                ),) ,
              )
            ],
          ),

        ],
      ),
    );
  }
}
