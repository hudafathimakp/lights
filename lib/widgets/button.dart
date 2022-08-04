import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.clr,
    required this.onTap,
    this.icn,
  }) : super(key: key);

  final Color clr;
  final VoidCallback onTap;
  final Widget? icn;
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: Duration(seconds: 1),
      animationDuration: Duration(seconds: 2),
      curve: Curves.easeIn,
      direction: Direction.horizontal,
      offset: 4,
      child: MaterialButton(

        child: icn,
        // height: 20,
        minWidth: 9,
        color: clr,
        shape: CircleBorder(),
        onPressed: onTap,
      ),
    );
  }
}