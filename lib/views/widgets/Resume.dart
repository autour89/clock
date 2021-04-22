import 'package:clock/blocs/HomeBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Resume extends StatelessWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
            onPressed: context.read<HomeBloc>().runPause,
            child: context.select<HomeBloc, bool>((HomeBloc bloc) => bloc.run)
                ? Icon(Icons.pause_circle_filled)
                : Icon(Icons.timer)),
        SizedBox(width: 20),
        FloatingActionButton(
            onPressed: context.read<HomeBloc>().reset,
            child: Icon(Icons.restore_rounded)),
      ],
    );
  }
}
