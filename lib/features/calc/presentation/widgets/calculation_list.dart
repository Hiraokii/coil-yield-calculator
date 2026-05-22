import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:flutter/material.dart';

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
