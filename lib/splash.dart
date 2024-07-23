
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todolist/todolist.dart';
//change
class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement( context, MaterialPageRoute(builder: (context)=> ToDoList(),
      )
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.pinkAccent,
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('To-Do-list' ,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                Lottie.asset('animation/Animation - 1721283120250.json'),
          ]
              ),
        ),
      );
  }
}
