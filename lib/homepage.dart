import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:slider_controller/slider_controller.dart';
import 'package:roomlights/widgets/bulb.dart';
import 'package:roomlights/widgets/button.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

int lampExpanded = 0;

class _PageOneState extends State<PageOne> {
  var value = 1.0;
  @override
  void initState() {
    super.initState();
    for (double i = 0; i < 1; i++) {
      Future.delayed(Duration(milliseconds: 300))
          .then((value) => setState(() => i = i + .1));
    }
  }

  var developer;
  int buttonvalue = 0;
  int selectedIndex = 0;
  final List<String> chipitems = ['Main Light', 'Desk Light', 'Bed Light'];
  final List<IconData> chipitemsIcon = [
    Icons.lightbulb,
    Icons.table_bar_outlined,
    Icons.bed_rounded
  ];
  Color color = Colors.amber;
  Color iconColor = Colors.amber;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple,Colors.purple]
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18, top: 50),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                              ),
                              Text("Bed",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ],
                          ),
                          Text("Room",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ShowUpAnimation(
                              delayStart: Duration(seconds: 1),
                              animationDuration: Duration(seconds: 2),
                              curve: Curves.easeInOut,
                              direction: Direction.vertical,
                              offset: 4,
                              child: Text("4 Lights",
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ShowUpAnimation(
                        delayStart: Duration(seconds: 1),
                        animationDuration: Duration(seconds: 2),
                        curve: Curves.easeInBack,
                        direction: Direction.vertical,
                        offset: 4,
                        child: Bulb(color: color)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 10,
                      children: List.generate(
                        chipitems.length,
                            (index) => ShowUpAnimation(
                          delayStart: Duration(seconds: 1),
                          animationDuration: Duration(seconds: 2),
                          curve: Curves.easeInOut,
                          direction: Direction.horizontal,
                          offset: 4,
                          child: ChoiceChip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            avatar: Icon(chipitemsIcon.elementAt(index),
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Color.fromARGB(255, 24, 167, 119)),
                            labelStyle: selectedIndex == index
                                ? TextStyle(color: Colors.white)
                                : TextStyle(
                                color: Color.fromARGB(255, 24, 167, 119)),
                            label: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(chipitems.elementAt(index),
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w500)),
                            ),
                            selectedColor: Color.fromARGB(255, 24, 167, 119),
                            backgroundColor: Colors.white,
                            selected: selectedIndex == index,
                            onSelected: ((value) => setState(() {
                              if (value) {
                                selectedIndex = index;
                              }
                            })),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text("Intensity",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Icon(
                              Icons.lightbulb,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            width: 280,
                            child: Slider(
                              activeColor: Colors.amber,
                              inactiveColor: Colors.grey,
                              value: value,
                              onChanged: (newValue) {
                                print(newValue);
                                setState(() {
                                  value = newValue;
                                  color = color.withOpacity(.4 + (0.5 * value));
                                  iconColor =
                                      iconColor.withOpacity(.4 + (0.5 * value));
                                });
                              },
                              divisions: 6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Icon(
                              Icons.lightbulb,
                              color: iconColor,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text("Colors",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CircleButton(
                                clr: Colors.deepOrange.shade300,
                                onTap: () {
                                  setState(() {
                                    color = Colors.deepOrange.shade300;
                                  });
                                }),
                          ),
                          CircleButton(
                              clr: Colors.green.shade400,
                              onTap: () {
                                setState(() {
                                  color = Colors.green.shade300;
                                });
                              }),
                          CircleButton(
                              clr: Colors.blue.shade400,
                              onTap: () {
                                setState(() {
                                  color = Colors.blue.shade400;
                                });
                              }),
                          CircleButton(
                              clr: Colors.deepPurple.shade400,
                              onTap: () {
                                setState(() {
                                  color = Colors.deepPurple.shade400;
                                });
                              }),
                          CircleButton(
                              clr: Colors.pink.shade300,
                              onTap: () {
                                setState(() {
                                  color = Colors.pink.shade300;
                                });
                              }),
                          CircleButton(
                              clr: Colors.yellow.shade300,
                              onTap: () {
                                setState(() {
                                  color = Colors.yellow.shade300;
                                });
                              }),
                          CircleButton(
                            clr: Colors.white,
                            onTap: () {},
                            icn: Icon(
                              Icons.add,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text("Scenes",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      ShowUpAnimation(delayStart: Duration(seconds: 1),
                        animationDuration: Duration(seconds: 2),
                        curve: Curves.bounceIn,
                        direction: Direction.horizontal,
                        offset: 4,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 120,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.deepOrange.shade300,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.lightbulb),
                                        Text("Birthday")
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.deepPurple.shade400,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.lightbulb),
                                        Text("Party")
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      ShowUpAnimation(delayStart: Duration(seconds: 1),
                        animationDuration: Duration(seconds: 2),
                        curve: Curves.bounceIn,
                        direction: Direction.horizontal,
                        offset: 4,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Container(
                                      width: 120,
                                      height: 40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blue.shade400,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(10))),
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            Icon(Icons.lightbulb),
                                            Text("Relax")
                                          ],
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green.shade300,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10))),
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(Icons.lightbulb),
                                          Text("Fun")
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // AnimatedContainer(
          //   duration: Duration(milliseconds: 300),
          //   margin: EdgeInsets.only(top: double.parse(lampExpanded.toString())),
          //   child: Container(
          //     child: Bulb(color: color),
          //   ),
          // ),
          Positioned(
              height: deviceHeight * .75,
              left: deviceWidth * .85,
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.power_settings_new, color: Colors.red),
                ),
              )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}
