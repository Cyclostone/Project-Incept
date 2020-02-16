import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incept_app/resultpage.dart';

class Getjson extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/cpp.json"),
      builder: (context, snapshot){
        List mydata = json.decode(snapshot.data.toString());
        if(mydata == null){
          return Scaffold(
           body: Center(
              child: Text(
                "Loading",
               style: TextStyle(
                  fontFamily: "Quando"
               ),
              )
            ),
          );
        }
        else{
          return Quizpage(mydata: mydata);
        }
      },
    );
  }
}

class Quizpage extends StatefulWidget {
  
  var mydata;

Quizpage({Key key, @required this.mydata}) : super(key : key);
  @override
  _QuizpageState createState() => _QuizpageState(mydata);
}

class _QuizpageState extends State<Quizpage> {

    var mydata;
    _QuizpageState(this.mydata);

    Color colortoshow = Colors.indigoAccent;
    Color right = Colors.green;
    Color wrong = Colors.red;
    int marks = 0;
    int i = 1;
    int timer = 30;
    String showtimer = "30";

  Map<String, Color> btncolor = {
    "a" : Colors.indigoAccent,
    "b" : Colors.indigoAccent,
    "c" : Colors.indigoAccent,
    "d" : Colors.indigoAccent,
  };

  bool canceltimer = false;

  @override
  void initState(){
    starttimer();
    super.initState();
  }

  void nextquestion(){
    canceltimer = false;
    timer = 30;
    if(i<10){
      i++;
    }
    else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ResultPage(marks : marks))
      );
    }

    btncolor["a"] = Colors.indigoAccent;
    btncolor["b"] = Colors.indigoAccent;
    btncolor["c"] = Colors.indigoAccent;
    btncolor["d"] = Colors.indigoAccent;
  }

  void starttimer() async{
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if(timer < 1){
          t.cancel();
          nextquestion();
        }else if(canceltimer == true){
          t.cancel();
        }else{
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }


    void checkAnswer(String k){
      if(mydata[2]["1"] == mydata[1]["1"][k]){
         marks += 5;
         colortoshow = right;
      }
      else{
        colortoshow = wrong;
      }
      setState(() {
        btncolor[k] = colortoshow;
      });

      Timer(Duration(seconds: 2), nextquestion);
    }

    
    


    Widget choiceButton(String k){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkAnswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);

    return WillPopScope(
      onWillPop: (){
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Incept",
            ),
            content: Text(
              "You can't Go Back At this stage."
            ),
            actions: <Widget>[
              FlatButton(
                onPressed:() {
                  Navigator.of(context).pop();
                },
              child: Text('OK'),
              )
            ],
          )
        );
      },
      child: Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                mydata[0][i.toString()],
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Quando",
                )
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              )
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  choiceButton("a"),
                  choiceButton("b"),
                  choiceButton("c"),
                  choiceButton("d")
                ]
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              child: Center(
                child: Text(
                  showtimer,
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Times New Roman',
                  )
                )
              ),
            ),
          )
        ]
      ),
    ),
    );
  }
}



// '''