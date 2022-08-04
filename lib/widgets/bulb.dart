import 'package:flutter/material.dart';


class Bulb extends StatelessWidget {
  const Bulb({
    Key? key,required this.color
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: EdgeInsets.only(top: 100),
      height: 150,
      width: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bulb.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 124, 0, 0),
            child: Container(
              height: 20,
              width: 30,
              decoration: BoxDecoration(
                  color:color,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20))),
            ),
          )
        ],
      ),
    );
  }
}
