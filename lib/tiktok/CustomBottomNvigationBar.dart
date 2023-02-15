
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addvideopage.dart';

class CustomBottomNvigationBar extends StatelessWidget {
  const CustomBottomNvigationBar(
      {Key? key, required this.selectedpageIndex, required this.onIconTap })
      : super(key: key);
  final int selectedpageIndex;
  final Function onIconTap;

  @override
  Widget build(BuildContext context) {
    final barHeight =MediaQuery.of(context).size.height*0.06;
    return BottomAppBar(
      color: selectedpageIndex==0 ? Colors.black:Colors.white,
      child: Container(
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _bottomBarNaviItem(0,'Home',TextStyle(),Icons.home),
            _bottomBarNaviItem(1,'Discover',TextStyle(),Icons.search) ,
            _addVideoItem(barHeight,context),
            _bottomBarNaviItem(3,'Inbox',TextStyle(),Icons.message),
            _bottomBarNaviItem(4,'Profile',TextStyle(),Icons.account_box_outlined),
          ],
        ),
      ),
    );
  }

  _bottomBarNaviItem(int index, String label, TextStyle textStyle,
       iconName) {
    bool isSelected = selectedpageIndex == index;
    Color iconAndtextcolor = isSelected ? Colors.black : Colors.grey;
    if (isSelected && selectedpageIndex == 0) {
      iconAndtextcolor = Colors.white;
    }

    return GestureDetector(
      onTap: ()=> (onIconTap(index)),
      child: Column(
mainAxisSize: MainAxisSize.min,
          children:[
          Icon(iconName,size: 25,color:selectedpageIndex==0? Colors.white :Colors.black,),
SizedBox(
  height: 3,
),
            Text(label,style: textStyle.copyWith(color:iconAndtextcolor ),          )
          ]
      ),
    );
  }
  _addVideoItem(double height,BuildContext context){
    return GestureDetector(
      onTap: ()=>{
        Navigator.push(context,
            MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context){
              return Addvideopage();
            }))
      },
      child: Container(
        height: height-15,
        width: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent,Colors.redAccent],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Container(
            width: 41,
            height: height-15,
            decoration: BoxDecoration(
              color: selectedpageIndex ==0 ?Colors.white:Colors.black,
            ),
            child: Icon(Icons.add,color: selectedpageIndex==0 ? Colors.black:Colors.white,),
          ),
        ),
      ),
    );
  }
}