import 'package:flutter/material.dart';
import 'package:incept_app/home.dart';

class ResultPage extends StatefulWidget {
  int marks;
  ResultPage({Key key, @required this.marks}) : super(key : key);
  @override
  _ResultPageState createState() => _ResultPageState(this.marks);
}

class _ResultPageState extends State<ResultPage> {
  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState(){
    if(marks<7){
      image = images[2];
      message = "You should Try Hard..\n" + "You Scored $marks\n" + "The predicted Course for you: Introduction to Python: Absolute Beginner";
    }
    else if(marks < 14){
      image = images[1];
      message = "You can Do Better..\n" + "You Scored $marks\n" + "The predicted Course for you: Introduction to Computer Science and Programming Using Python";
    }
    else if(marks < 21){
      image = images[1];
      message = "You can Do Better..\n" + "You Scored $marks\n" + "The predicted Course for you: Python and Django Full Stack Web Developer Bootcamp";
    }
    else if(marks < 28){
      image = images[1];
      message = "You can Do Better..\n" + "You Scored $marks\n" + "The predicted Course for you: Python I: Essentials";
    }
    else if(marks < 35){
      image = images[1];
      message = "You can Do Better..\n" + "You Scored $marks\n" + "The predicted Course for you: Georgia Tech: Introduction to Computing in Python";
    }
    else{
      image = images[0];
      message = "Congrats! You did very well!\n" + "You Scored $marks" + "The predicted Course for you: AI Programming with Python";
    }
    super.initState();
  }

  
  int marks;
  _ResultPageState(this.marks); 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                            image
                            )
                          )
                        )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                      child: Text(
                        message,
                        style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Quando",
                        )
                      ),
                    )
                    )
                  ],
                )
              )
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Homepage(),
                      )
                    );
                  },
                  child: Text(
                    "Continue"
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  borderSide:BorderSide(
                    width: 3.0,
                    color: Colors.indigo,
                  ), 
                  splashColor: Colors.indigoAccent
                )
              ]
            )
          )  
        ]
      ),
    );
  }
}