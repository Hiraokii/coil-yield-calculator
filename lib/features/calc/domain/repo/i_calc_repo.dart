import 'package:coil_yield_calculator/core/usecases/usecase.dart';
import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/last_calc.dart';
import 'package:coil_yield_calculator/features/calc/presentation/dto/calc_dto.dart';

abstract class ICalcRepo {
  ReturnFuture<CalcEntity> calculateYield(CalcParams params);
  ReturnFuture<CalcEntity> lastCalc(NoParams params);
  ReturnFuture<List<CalcEntity>> getHistory(NoParams params);
}
