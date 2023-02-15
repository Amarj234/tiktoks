import 'HomeSideBar.dart';
import 'VideoDetail.dart';
import 'video.dart';
import 'videotitle.dart';
import 'package:flutter/material.dart';

import 'mock.dart';

class Homepages extends StatefulWidget {
  const Homepages({Key? key}) : super(key: key);

  @override
  State<Homepages> createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepages> {
bool _isfollowingSelected=true;
int _snappedPageIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.transparent,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      GestureDetector(
        onTap: ()=>{
          setState((){
            _isfollowingSelected=true;
          })
        },
        child: Text("Following",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize:!_isfollowingSelected?  18:15,color: !_isfollowingSelected?  Colors.grey: Colors.white),),
      ),
      Text("  |   ",
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15,color: Colors.grey),),
      GestureDetector(
        onTap: ()=>{
          setState((){
            _isfollowingSelected=false;
          })
        },
        child: Text("For you" ,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize:!_isfollowingSelected?  18:15,color: !_isfollowingSelected?  Colors.white: Colors.grey)),
      ),
    ],
  ),
),
      body: PageView.builder(
        onPageChanged: (int page)=>{
          setState((){
            _snappedPageIndex=page;
          })
        },
        itemCount: videos.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              videotitle(video: videos[index],
currentIndex: index,
                snappedPageIndex: _snappedPageIndex,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3 ,
                    child: Container(

                      height: MediaQuery.of(context).size.height/4,
                      child: VideoDetail(
                        video: videos[index],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height/1.75,

child: HomeSideBar( video: videos[index]),
                    ),
                  ),
                ],
              ),
            ],
          );

      })
    );
  }
}
