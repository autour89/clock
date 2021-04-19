import 'package:clock/blocs/HomeBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = context.select<HomeBloc, int>((HomeBloc bloc) => bloc.count);
    return Text(
      '$count',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
