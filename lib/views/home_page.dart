import 'package:clock/views/widgets/count_widget.dart';
import 'package:clock/views/widgets/resume_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        children: const [
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
