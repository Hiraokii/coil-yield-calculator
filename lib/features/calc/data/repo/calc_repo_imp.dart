import 'package:coil_yield_calculator/core/usecases/usecase.dart';
import 'package:coil_yield_calculator/features/calc/data/source/calc_source.dart';
import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:coil_yield_calculator/features/calc/domain/repo/i_calc_repo.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/failures/calc_failure.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/last_calc.dart';
import 'package:coil_yield_calculator/features/calc/presentation/dto/calc_dto.dart';
import 'package:dartz/dartz.dart';

class CalcRepoImp implements ICalcRepo {
  final ICalcSource _source;
  CalcRepoImp({required source}) : _source = source;
  @override
  ReturnFuture<CalcEntity> calculateYield(CalcParams params) async {
    final model = params.toModel();
    final result = await _source.calculateYield(model);
    return Right(result);
  }

  @override
  ReturnFuture<CalcEntity> lastCalc(NoParams params) async {
    try {
      final result = await _source.lastCalc(params);
      return Right(result);
    } on Exception {
      return Left(CalcFailure(errorMsg: 'Nenhum calculo foi encontrado'));
    }
  }

  @override
  ReturnFuture<List<CalcEntity>> getHistory(NoParams params) async {
    try {
      final list = await _source.getHistory(params);
      final result = list.cast<CalcEntity>();
      return Right(result);
    } on Exception {
      return Left(CalcFailure(errorMsg: 'We couldnt get the historical data'));
    }
  }
}
