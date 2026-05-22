import 'package:coil_yield_calculator/core/shared/failures/failure.dart';
import 'package:coil_yield_calculator/core/usecases/usecase.dart';
import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/failures/calc_failure.dart';
import 'package:coil_yield_calculator/features/calc/domain/repo/i_calc_repo.dart';
import 'package:coil_yield_calculator/features/calc/presentation/dto/calc_dto.dart';
import 'package:dartz/dartz.dart';

class CalculateYield implements Usecase<CalcDto, CalcEntity> {
  final ICalcRepo _repo;
  CalculateYield({required ICalcRepo repo}) : _repo = repo;
  @override
  ReturnFuture<CalcEntity> call(CalcDto dto) async {
    final CalcParams? params = dto.toParams();
    if (params == null) {
      return Left(CalcFailure(errorMsg: 'All Fields are necessary!'));
    }
    return await _repo.calculateYield(params);
  }
}
