import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class UI1 extends StatefulWidget {
  @override
  _UI1State createState() => _UI1State();
}

class _UI1State extends State<UI1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('images/logo.png',
              height: 65.0,
              width: 65.0),
            ),
            SizedBox(
              height: 300,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Showcase the ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: 'STAR', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffaf61a5),),),
                    TextSpan(text: ' in you'),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Text('Showcase your story through our '
                    'visually captivating profile builder!',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0), textAlign: TextAlign.center,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:30),
              child: Center(
                child: DotsIndicator(
                  dotsCount: 4,
                  position: 0,
                  decorator: DotsDecorator(
                    color: Color(0xff999999), // Inactive color
                    activeColor: Color(0xff4f439a),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}


