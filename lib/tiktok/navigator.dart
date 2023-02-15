import 'CustomBottomNvigationBar.dart';
import 'addvideopage.dart';
import 'discover.dart';
import 'homepage.dart';
import 'inboxpage.dart';
import 'profilepage.dart';
import 'package:flutter/material.dart';


class navigatorcontaner extends StatefulWidget {
  const navigatorcontaner({Key? key}) : super(key: key);

  @override
  _navigatorcontanerState createState() => _navigatorcontanerState();
}

class _navigatorcontanerState extends State<navigatorcontaner> {
  int _selectetpageindex=0;
  static const List<Widget>_pages=[ Homepages(),Discover(),profilepage(),Addvideopage(),Inboxpage()];

void _onIcontabped (int index){
  setState(() {
    _selectetpageindex=index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectetpageindex],
      ),
      bottomNavigationBar: CustomBottomNvigationBar(
          selectedpageIndex :_selectetpageindex,
        onIconTap: _onIcontabped,
      ),
    );
  }
}
