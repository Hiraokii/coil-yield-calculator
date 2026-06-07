import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coil_yield_calculator/features/calc/presentation/cubit/history_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Reset HistoryCubit to initial state (clears history)
          context.read<HistoryCubit>().emit(HistoryInitial());
        },
        child: const Text('Reset All Calculations'),
      ),
    );
  }
}
