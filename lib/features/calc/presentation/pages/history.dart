import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:coil_yield_calculator/features/calc/presentation/cubit/history_cubit.dart';
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

class CalculationsList extends StatelessWidget {
  final List<CalcEntity> list;
  const CalculationsList({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset('assets/coil_blue.png'),
          title: Text(
            '${list[index].outerDiameter}mm/${list[index].innerDiameter}mm',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            '${list[index].date.year}/${list[index].date.month}/${list[index].date.day}',
          ),
          trailing: Text(
            '${list[index].piecesQnty} pcs',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
    );
  }
}

class HistoryCard extends StatelessWidget {
  final List<CalcEntity> list;
  const HistoryCard({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Align(
            alignment: AlignmentGeometry.centerStart,
            child: Text(
              'Recent Calculations',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.transparent,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: CalculationsList(list: list),
            ),
          ),
        ),
      ],
    );
  }
}
