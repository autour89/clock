import 'package:clock/views/widgets/Count.dart';
import 'package:clock/views/widgets/Resume.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Count(),
          ),
          Expanded(
            child: Resume(),
          )
        ],
      ),
    ));
  }
}
