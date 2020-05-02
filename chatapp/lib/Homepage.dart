import 'package:flutter/material.dart';
import 'Chatscreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Utsav Chat"),
        ), 
        body: new Chatscreen()   
             
    );
  }
}