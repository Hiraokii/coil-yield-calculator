class CalcEntity {
  final DateTime date;
  final double innerDiameter;
  final double outerDiameter;
  final double thickness;
  final double pitch;
  final int? piecesQnty;
  final double? materialLength;

  CalcEntity({
    required this.date,
    required this.innerDiameter,
    required this.outerDiameter,
    required this.thickness,
    required this.pitch,
    required this.piecesQnty,
    required this.materialLength,
  });
}
