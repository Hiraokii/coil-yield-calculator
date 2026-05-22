import 'package:coil_yield_calculator/features/calc/data/models/calc_model.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/last_calc.dart';
import 'package:coil_yield_calculator/features/calc/presentation/dto/calc_dto.dart';
import 'dart:math';

import 'package:hive_ce/hive.dart';

abstract class ICalcSource {
  Future<CalcModel> calculateYield(CalcModel model);
  Future<CalcModel> lastCalc(NoParams params);
  Future<List<CalcModel>> getHistory(NoParams params);
}

class CalcSource implements ICalcSource {
  final Box box;
  CalcSource({required this.box});
  @override
  Future<CalcModel> calculateYield(CalcModel model) async {
    try {
      final outerRadius = model.outerDiameter / 2;
      final innerRadius = model.innerDiameter / 2;

      final area =
          ((outerRadius * outerRadius) - (innerRadius * innerRadius)) * pi;

      final length = area / model.thickness;
      final pieces = (length / model.pitch).floor();

      final result = CalcModel(
        date: model.date,
        innerDiameter: model.innerDiameter,
        outerDiameter: model.outerDiameter,
        thickness: model.thickness,
        pitch: model.pitch,
        piecesQnty: pieces,
        materialLength: length,
      );
      //add to hive box before return
      await box.add(result.toMap());

      return result;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<CalcModel> lastCalc(params) async {
    if (box.isEmpty) {
      throw Exception('No calculations history');
    }
    // Pega o último item adicionado
    final result = box.getAt(box.length - 1);
    return CalcModel.fromMap(Map<dynamic, dynamic>.from(result as Map));
  }

  @override
  Future<List<CalcModel>> getHistory(NoParams params) async {
    try {
      final list = box.values.map((item) => CalcModel.fromMap(item)).toList();
      return list.reversed.toList();
    } on Exception {
      throw Exception('erro');
    }
  }
}
