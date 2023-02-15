import 'dart:math';

import 'video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  State<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends State<HomeSideBar>
with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState(){
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 5),

    );
    _animationController.repeat();

    super.initState();
  }
  @override
  void dispose() {
   _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style= Theme.of(context).textTheme
    .bodyText1!
    .copyWith(fontSize: 13,color: Colors.white);
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _profileImageButton(widget.video.posteBy.profileImageurl),
        _sideBarItem('heart',widget.video.links,style),
        _sideBarItem('comment',widget.video.comment,style),
        _sideBarItem('share','Share',style),
        AnimatedBuilder(animation: _animationController,
            child: Stack(
             alignment: Alignment.center,
              children: [
              Container(
                height: 50,
                width: 50,
               child: Image.asset('assets/disc.png',height: 50,width: 50,),
              ),
              CircleAvatar(radius: 12,backgroundImage: NetworkImage('https://picsum.photos/id/1062/400'),)
            ],),
            builder: (context,child){
          return Transform.rotate(angle: 2* pi *_animationController.value,
          child: child,);
        })

      ],
      ),
    );
  }

  _sideBarItem(String iconName ,String label,TextStyle style){
    return Column(
      children: [
        SvgPicture.asset('assets/$iconName.svg',height: 50,width: 50,color: Colors.white,),
        SizedBox(
          height: 5,
        ),
        Text(label,style: style,)
      ],
    );
  }

  _profileImageButton( String imageUrl){
    return Stack(
      clipBehavior:Clip.none ,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            )
          ),
        ),
        Positioned(child: Container(
decoration: BoxDecoration(
  color: Colors.red,
  borderRadius: BorderRadius.circular(25)
),
          child:Icon(Icons.add,size: 20,),
        ),
        ),
      ],
    );
  }
}
