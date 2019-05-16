import 'package:flutter/material.dart';

class AnimationDemos extends StatefulWidget {
  @override
  _AnimationDemosState createState() => _AnimationDemosState();
}

class _AnimationDemosState extends State<AnimationDemos> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addListener((){
      setState(() {

      });
    });
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        controller.reverse();
      } else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildBody(){
//    return AnimatedLogo(animation: animation,);
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demos'),
      ),
      body: _buildBody(),
    );
  }
}

class AnimatedLogo extends AnimatedWidget{
  AnimatedLogo({Key key, Animation<double>animation})
    : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
