import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addvideopage extends StatefulWidget {
  const Addvideopage({Key? key}) : super(key: key);

  @override
  State<Addvideopage> createState() => _AddvideopageState();
}

class _AddvideopageState extends State<Addvideopage> {
  PageController _pageController=PageController(initialPage:1,viewportFraction:0.2);
  int _selectedTap=1;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     extendBodyBehindAppBar: true,
      body: Column(
        children: [
         _buildCameraPreview(),
          Spacer(),
          Container(
            color: Colors.red,
            height: 90,
            child: _buildCameraTemplateSelector(),
          )
        ],
      ),
    );
  }

  Widget _buildCameraPreview(){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:75,left: 24),
            child: Row(
              children: [
                GestureDetector(
                    onTap:()=>{
    Navigator.pop(context),
    },
                    child: Icon(
                      Icons.close,color: Colors.white,
                    ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.music_note_2,
                        color: Colors.white,

                      ),
                      Text("add Sound"),
                    ],
                  ),
                )
              ],
            ),
          )
        ],

      ),
    );
  }




    Widget _buildCameraTemplateSelector(){
    final List<String>postType=["camera","Quick","Templates"];
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13,color: Colors.white,fontWeight:FontWeight.bold );

      return Stack(
alignment: Alignment.topCenter,
        children: [
          Container(
            height: 45,
            child: PageView.builder(
              controller: _pageController,
                onPageChanged: ( int page)=>{
                setState((){
                  _selectedTap=page;
                })
                },
                itemCount: postType.length,
                itemBuilder: (contaxt,index){
                  return Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
child: Text(postType[index],style:style.copyWith(color:_selectedTap==index ?
Colors.white :Colors.grey) ,),
                  );
                }

            ),
          ),
          Container(
            width: 50,
            height: 45,
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 2.5,

            ),

          )
        ],
      );
    }
}
