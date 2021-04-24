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
            onPressed: context.read<HomeBloc>().runTimer,
            child: context.select<HomeBloc, bool>((bloc) => bloc.counter.isRun)
                ? Icon(Icons.pause)
                : Icon(Icons.timer)),
        SizedBox(width: 20),
        if (context.select<HomeBloc, bool>((bloc) => !bloc.counter.isReset))
          FloatingActionButton(
              onPressed: context.read<HomeBloc>().counter.reset,
              child: Icon(Icons.restore_rounded)),
      ],
    );
  }
}
