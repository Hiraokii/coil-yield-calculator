import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';

class CalcModel extends CalcEntity {
  CalcModel({
    required super.date,
    required super.innerDiameter,
    required super.outerDiameter,
    required super.thickness,
    required super.pitch,
    required super.piecesQnty,
    required super.materialLength,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'innerDiameter': innerDiameter,
      'outerDiameter': outerDiameter,
      'thickness': thickness,
      'pitch': pitch,
      'piecesQnty': piecesQnty,
      'materialLength': materialLength,
    };
  }

  factory CalcModel.fromMap(Map<dynamic, dynamic> json) {
    return CalcModel(
      date: json['date'],
      innerDiameter: json['innerDiameter'] as double,
      outerDiameter: json['outerDiameter'] as double,
      thickness: json['thickness'] as double,
      pitch: json['pitch'] as double,
      piecesQnty: json['piecesQnty'] as int?,
      materialLength: json['materialLength'] as double?,
    );
  }
}
