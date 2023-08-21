import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathpuzzel1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class nxt extends StatefulWidget {
  int index;
  String ans;
  nxt(this.index, this.ans);

  @override
  State<nxt> createState() => _nxtState();
}

class _nxtState extends State<nxt> {
  SharedPreferences ?prefs;
  get()
  async {
    prefs = await SharedPreferences.getInstance();
    index = prefs!.getInt("value1")??0;
  }
  @override
  int index = 0;
  String ans = "";
  bool temp1 = false;
  bool temp2 = false;
  bool temp3 = false;
  bool temp4 = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("image/background.jpg"))),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("𝑷𝑼𝒁𝒁𝑬𝑳 𝑪𝑶𝑴𝑷𝑳𝑬𝑻𝑬𝑫",
                        style: TextStyle(fontSize: 30, color: Colors.blue)),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      height: 600,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/trophy.png"))),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Home.prefs!.setInt("value1", widget.index);
                      Navigator.pop(context);
                      setState(() {

                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.black45,
                            Colors.white70,
                            Colors.black26,
                            Colors.black45
                          ]),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text("CONTINUE", style: TextStyle(fontSize: 25)),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      prefs!.setInt("value1", widget.index);
                      Navigator.push(context, CupertinoPageRoute(builder: (context) {
                        return Home();
                      },));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.black45,
                            Colors.white70,
                            Colors.black26,
                            Colors.black45
                          ]),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text("MAIN MENU", style: TextStyle(fontSize: 25)),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.black45,
                            Colors.white70,
                            Colors.black26,
                            Colors.black45
                          ]),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text("BUY PRO", style: TextStyle(fontSize: 25)),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "𝑺𝑯𝑨𝑹𝑬 𝑻𝑯𝑰𝑺 𝑷𝑼𝒁𝒁𝑬𝑳",
                  style: TextStyle(fontSize: 25, color: Colors.blue),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(margin: EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.black45,
                          Colors.white70,
                          Colors.black26,
                          Colors.black45
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Icon(Icons.share))
              ],
            ),
            Expanded(child: Text("")),
          ]),
        ),
      ),
    );
  }
}
