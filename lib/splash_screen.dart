import 'dart:async';
import 'package:flutter/material.dart';
import 'package:getx/view_screens/home_page.dart';
import 'package:get/get.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Get.to(() => const HomePage());
   /* Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));*/
  }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(bottom: 30.0))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center
          ),
        ],
      ),
    );
  }
}
