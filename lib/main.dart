import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathpuzzel1/data.dart';
import 'package:mathpuzzel1/lock_page.dart';
import 'package:mathpuzzel1/play_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  static SharedPreferences? prefs;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List skip=List.filled(75, "");
  get1() async {
    Home.prefs = await SharedPreferences.getInstance();
    index = Home.prefs!.getInt("value1") ?? 0;
    for(int i=0;i<skip.length;i++)
      {
        print(Home.prefs!.getString("skip_level"));
        skip[i]=Home.prefs!.getString("skip_level$i")??"";
        print(skip);
      }
    setState(() {});
  }

  int index = 0;
  String a = "one";
  bool sub123 = false;
  bool temp1 = false;
  bool temp2 = false;
  bool temp3 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get1();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("image/background.jpg"))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text("𝙼𝚊𝚝𝚑 𝚙𝚞𝚣𝚣𝚎𝚕𝚜",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.blueAccent,
                              fontFamily: "one"),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "image/blackboard_main_menu.png"))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTapCancel: () {
                                temp1 = false;
                                setState(() {});
                              },
                              onTap: () {
                                temp1=true;
                                setState(() {

                                });
                              },
                              onTapDown: (details) {
                                temp1 = true;
                                setState(() {});
                              },
                              onTapUp: (details) {
                                temp1 = false;
                                setState(() {});
                              },
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, CupertinoPageRoute(
                                      builder: (context) {
                                        return playing(index,);
                                      },
                                    ));
                                  },
                                  child: Container(
                                      height: 45,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          border: temp1
                                              ? Border.all(
                                                  color: Colors.white, width: 2)
                                              : null,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      margin: EdgeInsets.all(20),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "CONTINUE",
                                        style: TextStyle(
                                            fontFamily: a,
                                            fontSize: 30,
                                            color: Colors.white),
                                      ))),
                            ),
                            GestureDetector(
                              onTapCancel: () {
                                temp2 = false;
                                setState(() {});
                              },
                              onTapDown: (details) {
                                temp2 = true;
                                setState(() {});
                              },
                              onTapUp: (details) {
                                temp2 = false;
                                setState(() {});
                              },
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, CupertinoPageRoute(
                                      builder: (context) {
                                        return level_page(index,skip);
                                      },
                                    ));
                                  },
                                  child: Container(
                                      height: 45,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          border: temp2
                                              ? Border.all(
                                                  color: Colors.white, width: 2)
                                              : null,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      margin: EdgeInsets.all(20),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "PUZZELS",
                                        style: TextStyle(
                                            fontFamily: a,
                                            fontSize: 30,
                                            color: Colors.white),
                                      ))),
                            ),
                            GestureDetector(
                              onTapCancel: () {
                                temp3 = false;
                                setState(() {});
                              },
                              onTapDown: (details) {
                                temp3 = true;
                                setState(() {});
                              },
                              onTapUp: (details) {
                                temp3 = false;
                                setState(() {});
                              },
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                    height: 45,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        border: temp3
                                            ? Border.all(
                                                color: Colors.white, width: 2)
                                            : null,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    margin: EdgeInsets.all(20),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "BUY PRO",
                                      style: TextStyle(
                                          fontFamily: a,
                                          fontSize: 30,
                                          color: Colors.white),
                                    )),
                              ),
                            )
                          ])),
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 23),
                        child: Text("AD",
                            style: TextStyle(
                                fontSize: 15, color: Colors.blueAccent))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 20),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/ltlicon.png"))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(bottom: 10, left: 10, top: 10),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                gradient: LinearGradient(colors: [
                                  Colors.black45,
                                  Colors.white70,
                                  Colors.black26,
                                  Colors.black45
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Icon(Icons.share)),
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                bottom: 10, right: 10, top: 10, left: 10),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                gradient: LinearGradient(colors: [
                                  Colors.black45,
                                  Colors.white70,
                                  Colors.black26,
                                  Colors.black45
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Icon(Icons.mail_outline)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 150,
                      decoration: BoxDecoration(border: Border.all(width: 2)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(

              actions: [
                TextButton(
                    onPressed: () {
                     exit(0);
                    },
                    child: Text("Yes")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No")),
              ],
              title: Text("are you sure you want to exit"),
            );
          },
        );
        return true;
      },
    );
  }
}
