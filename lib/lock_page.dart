import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathpuzzel1/data.dart';
import 'package:mathpuzzel1/play_page.dart';

class level_page extends StatefulWidget {
  int sub;
  List ar;
  level_page(this.sub, this.ar);

  @override
  State<level_page> createState() => _level_pageState();
}

class _level_pageState extends State<level_page> {
  static bool temp = true;

  @override
  List tempa1 = List.filled(data_all.image.length, false);

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("image/background.jpg"))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Select Puzzel",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent, fontSize: 35),
                    )),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: data_all.image.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTapCancel: () {
                      tempa1[index] = false;
                      setState(() {});
                    },
                    onTap: () {
                      tempa1[index] = true;
                      setState(() {});
                    },
                    onTapDown: (details) {
                      tempa1[index] = true;
                      print("color");
                      setState(() {});
                    },
                    onTapUp: (details) {
                      tempa1[index] = false;
                      setState(() {});
                    },
                    child: InkWell(
                      onTap: () {
                        if (widget.sub + 1 > index) {
                          Navigator.push(context, CupertinoPageRoute(
                            builder: (context) {
                              return playing(index);
                            },
                          ));
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        child: (index >= widget.sub)
                            ? null
                            : Text("${index + 1}",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontFamily: "one")),
                        decoration: BoxDecoration(
                            color: (tempa1[index] == true) ? Colors.red : null,
                            border: (index >= widget.sub)
                                ? null
                                : (tempa1[index] == true)
                                    ? Border.all(width: 3, color: Colors.black)
                                    : Border.all(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            image: (widget.sub >index )
                                ? DecorationImage(
                                    image: AssetImage("image/tick.png"))
                                : DecorationImage(
                                    image: AssetImage("image/lock.png"))),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
