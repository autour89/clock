import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/blocs/home_bloc.dart';

class DisplayView extends StatelessWidget {
  final bool isTimer;

  const DisplayView({Key? key, required this.isTimer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.select<HomeBloc, String>(
          (HomeBloc bloc) => isTimer ? bloc.timerDuration : bloc.timeDuration),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
