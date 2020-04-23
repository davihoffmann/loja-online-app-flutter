import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    //_pageController.animateToPage(page, duration: null, curve: null);
    //_pageController.jumpToPage(page)

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(color: Colors.red,),
        Container(color: Colors.yellow,),
        Container(color: Colors.green,)
      ],
    );

  }

}
