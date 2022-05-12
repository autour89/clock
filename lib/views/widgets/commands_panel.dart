import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/blocs/home_bloc.dart';

class CommandsView extends StatelessWidget {
  final bool isTimer;

  const CommandsView({Key? key, required this.isTimer}) : super(key: key);

  void _selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? const Center(child: Text('Empty')),
        );
      },
    );

    const Widget dialog = TimePickerDialog(
      initialTime: TimeOfDay(hour: 0, minute: 0),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      context.read<HomeBloc>().counter.newTime =
          Duration(hours: newTime.hour, minutes: newTime.minute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
            onPressed: isTimer
                ? context.read<HomeBloc>().runTimer
                : context.read<HomeBloc>().runStopWatch,
            child: context.select<HomeBloc, bool>((bloc) =>
                    isTimer ? bloc.counter.isRun : bloc.stopwatch.isRun)
                ? const Icon(Icons.pause)
                : const Icon(Icons.timer)),
        const SizedBox(width: 20),
        if (context.select<HomeBloc, bool>((bloc) =>
            isTimer ? !bloc.counter.isReset : !bloc.stopwatch.isReset))
          FloatingActionButton(
              onPressed: isTimer
                  ? context.read<HomeBloc>().counter.reset
                  : context.read<HomeBloc>().stopwatch.reset,
              child: const Icon(Icons.restore_rounded)),
        FloatingActionButton(
          onPressed: () => _selectTime(context),
          child: const Icon(Icons.search),
        )
      ],
    );
  }
}
