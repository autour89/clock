import 'package:clock/blocs/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Resume extends StatelessWidget {
  const Resume({Key? key}) : super(key: key);

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
            onPressed: context.read<HomeBloc>().runTimer,
            child: context.select<HomeBloc, bool>((bloc) => bloc.counter.isRun)
                ? const Icon(Icons.pause)
                : const Icon(Icons.timer)),
        const SizedBox(width: 20),
        if (context.select<HomeBloc, bool>((bloc) => !bloc.counter.isReset))
          FloatingActionButton(
              onPressed: context.read<HomeBloc>().counter.reset,
              child: const Icon(Icons.restore_rounded)),
        FloatingActionButton(
          onPressed: () => _selectTime(context),
          child: const Icon(Icons.search),
        )
      ],
    );
  }
}
