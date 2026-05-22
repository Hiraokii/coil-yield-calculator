import 'package:coil_yield_calculator/features/calc/data/models/calc_model.dart';

class CalcDto {
  final String innerDiameter;
  final String outerDiameter;
  final String thickness;
  final String pitch;
  const CalcDto({
    required this.innerDiameter,
    required this.outerDiameter,
    required this.thickness,
    required this.pitch,
  });

  CalcParams? toParams() {
    final innerValue = double.tryParse(innerDiameter.replaceAll(',', '.'));
    final outerValue = double.tryParse(outerDiameter.replaceAll(',', '.'));
    final thicknessValue = double.tryParse(thickness.replaceAll(',', '.'));
    final pitchValue = double.tryParse(pitch.replaceAll(',', '.'));

    if (innerValue == null ||
        outerValue == null ||
        thicknessValue == null ||
        pitchValue == null) {
      return null;
    }
    if (outerValue <= innerValue) {
      return null;
    }
    return CalcParams(
      date: DateTime.now(),
      innerDiameter: innerValue,
      outerDiameter: outerValue,
      thickness: thicknessValue,
      pitch: pitchValue,
    );
  }
}

class CalcParams {
  final DateTime date;
  final double innerDiameter;
  final double outerDiameter;
  final double thickness;
  final double pitch;
  CalcParams({
    required this.date,
    required this.innerDiameter,
    required this.outerDiameter,
    required this.thickness,
    required this.pitch,
  });

  CalcModel toModel() {
    return CalcModel(
      date: date,
      innerDiameter: innerDiameter,
      outerDiameter: outerDiameter,
      thickness: thickness,
      pitch: pitch,
      piecesQnty: null,
      materialLength: null,
    );
  }
}
