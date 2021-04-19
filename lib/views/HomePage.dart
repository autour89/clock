import 'package:clock/blocs/HomeBloc.dart';
import 'package:clock/views/widgets/Count.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Count(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<HomeBloc>().increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
