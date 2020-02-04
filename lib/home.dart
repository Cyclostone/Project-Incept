import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incept_app/quizpage.dart';

class Homepage extends StatefulWidget{
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>{

  List<String> captions = [
    "a procedure intended to establish the quality, performance, or reliability of something, especially before it is taken into widespread use.",
    "C++ is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or C with Classes.",
    "Java is a general-purpose programming language that is class-based, object-oriented, and designed to have as few implementation dependencies as possible",
    "JavaScript, often abbreviated as JS, is a high-level, just-in-time compiled, multi-paradigm programming language that conforms to the ECMAScript specification",
    "Linux is a family of open source Unix-like operating systems based on the Linux kernel, an operating system kernel first released on September 17, 1991, by Linus Torvalds."
  ];


  List<String> images = [
    "images/download.jpg",
    "images/cpp.png",
    "images/java.png",
    "images/js.png",
    "images/linux.png",

  ];
  
  Widget customCard(String langname, String image, String caption){
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Getjson(),
          ));
        },
        child: Material(
          color: Colors.indigo,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            image,
                          )
                        )
                      )
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontFamily: "Alike",
                      fontWeight: FontWeight.w200
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    caption,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Alike"
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.left,
                  ),
                )
              ]
            ),
          )
        )
      ),
    );
  }
  
  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Incept",
          style: TextStyle(
            fontFamily: "Satisfy",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customCard("Explore", images[0], captions[0]),
          customCard("Test", images[1], captions[1]),
          customCard("Test", images[2], captions[2]),
          customCard("Test", images[3], captions[3]),
          customCard("Test", images[4], captions[4]),
        ]
      ),
    );
  }
}