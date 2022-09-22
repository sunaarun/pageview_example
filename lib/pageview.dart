import 'dart:async';
import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  List<String> imageList =
  [
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/4.jpg",
    "images/5.jpg",
    "images/6.jpg",
    "images/7.jpg",
    "images/8.jpg",
  ];
  int pageIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer){
      if(pageIndex <imageList.length-1)
      { setState(() {
        pageIndex ++;});}
      else {
        setState(() {
          pageIndex =0;
        });}
      _controller.animateToPage(pageIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutExpo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(title: Text("PageView App"),),
      body: PageView.builder(
        controller: _controller,
        itemCount: imageList.length,
        itemBuilder: (context, index){
          return Image.asset(imageList[index], fit: BoxFit.cover,);
        },
        onPageChanged: (newVal){
          setState(() {
            pageIndex= newVal;
            print("$pageIndex");
          });
        },
      ),
    );
  }
}
