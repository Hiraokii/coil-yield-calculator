import 'package:coil_yield_calculator/features/calc/presentation/cubit/history_cubit.dart';
import 'package:coil_yield_calculator/features/calc/presentation/widgets/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryCubit, HistoryState>(
      builder: (context, state) {
        return switch (state) {
          HistoryInitial() => HistoryCard(list: []),
          HistoryLoading() => HistoryCard(list: []),
          HistoryError() => HistoryCard(list: []),
          HistoryLoaded() => HistoryCard(list: state.list),
        };
      },
      listener: (context, state) {
        //
      },
    );
  }
}
