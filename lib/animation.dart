import 'package:flutter/material.dart';

class Animations extends StatefulWidget {

  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> with SingleTickerProviderStateMixin{

 AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)..addListener(() { 
      setState(() {
        
      });
    });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         height: MediaQuery.of(context).size.height*0.085,
              child: ShaderMask(
                child: Text("NUSUKI",textAlign: TextAlign.center,
                
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 50),),
                shaderCallback: (rect){
                return LinearGradient(
                  stops: [_animation.value - 0.9,_animation.value,_animation.value +0.5],
                  colors: [
                    Color(int.parse("0xff124734")),
                    Color(int.parse("0xffffff1c")),
                    Color(int.parse("0xffFFFFFF")),]
                    ).createShader(rect);
              },),
            ),
    );
  }
}