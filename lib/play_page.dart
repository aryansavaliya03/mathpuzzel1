import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathpuzzel1/data.dart';
import 'package:mathpuzzel1/lock_page.dart';
import 'package:mathpuzzel1/main.dart';
import 'package:mathpuzzel1/next_change.dart';
import 'package:shared_preferences/shared_preferences.dart';

class playing extends StatefulWidget {
  int pos;
  // List ar;
  playing(this.pos);

  @override
  State<playing> createState() => _playingState();
}

class _playingState extends State<playing> {
  String ans = "";
  bool temp = false;
  bool sub = false;
  List skip=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get1();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("image/gameplaybackground.jpg"))),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  "\nAre you sure you want to skip this level? "),
                              actions: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            // DateTime dt = DateTime.now();
                                            // String ab = dt.toString();
                                            // DateTime dt1 = DateTime.now();
                                            // dt = DateTime.parse(ab).difference(other);
                                            data_all.puzzelno[widget.pos];
                                            data_all.image[widget.pos];
                                            widget.pos++;
                                            Navigator.pop(context);
                                            Home.prefs!
                                                .setInt("value1", widget.pos);
                                            setState(() {});
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            child: Text(
                                              "yes",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            alignment: Alignment.center,
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.white30,
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                          )),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            child: Text(
                                              "no",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            alignment: Alignment.center,
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.white30,
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                        );
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/skip.png"))),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      height: 70,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/level_board.png"))),
                      child: Text(
                        "${data_all.puzzelno[widget.pos]}",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("${data_all.hint[widget.pos]}"),
                            );
                          },
                        );
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/hint.png"))),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.all(10),
                      height: 600,
                      width: 600,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("${data_all.image[widget.pos]}"))),
                    ))
                  ],
                ),
              ),
              Expanded(
                  child: SizedBox(
                height: 20,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Container(
                    height: 130,
                    color: Colors.black,
                    child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.all(10),
                            height: 40,
                            width: 290,
                            child: Text("$ans", style: TextStyle(fontSize: 25)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.blue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                          )),
                          InkWell(
                            onTap: () {
                              if (ans == "") {
                                null;
                              } else {
                                ans = ans.substring(0, ans.length - 1);
                              }
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("image/delete.png"))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (int.parse(ans) == data_all.ans[widget.pos]) {
                                widget.pos++;
                                ans = "";
                                Home.prefs!.setInt("value1", widget.pos);
                                Home.prefs!.setString("skip_level${widget.pos}", "yes");
                                Navigator.push(context, CupertinoPageRoute(
                                  builder: (context) {
                                    return nxt(widget.pos, ans);
                                  },
                                ));
                                setState(() {});
                              } else {
                                Home.prefs!.setInt("value1", widget.pos);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              height: 40,
                              width: 80,
                              child: Text(
                                "SUBMIT",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          add("1"),
                          add("2"),
                          add("3"),
                          add("4"),
                          add("5"),
                          add("6"),
                          add("7"),
                          add("8"),
                          add("9"),
                          add("0"),
                        ],
                      )
                    ]),
                  )),
                ],
              )
            ]),
          ),
        ),
      ),
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actions: [
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home();
                  },));
                }, child: Text("Yes")),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("No")),
              ],
              title: Text("are you sure you want to exit"),
            );
          },
        );
        return true;
      },
    );
  }

  Widget add(String n) {
    return Expanded(
        child: InkWell(
            onTap: () => get("$n"),
            child: Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              height: 40,
              width: 36,
              decoration: BoxDecoration(
                  color: (temp == true) ? Colors.white30 : Colors.white30,
                  border: Border.all(width: 1, color: Colors.white60),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Text("$n",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            )));
  }

  get(String s) {
    ans = ans + s;
    setState(() {});
  }
}
