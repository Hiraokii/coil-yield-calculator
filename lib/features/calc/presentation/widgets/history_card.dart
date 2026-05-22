import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:coil_yield_calculator/features/calc/presentation/widgets/calculation_list.dart';
import 'package:flutter/material.dart';

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
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: list.isEmpty
                  ? SizedBox(
                      width: double.infinity,
                      child: Text(
                        'No calculations available yet',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : CalculationsList(list: list),
            ),
          ),
        ),
      ],
    );
  }
}
