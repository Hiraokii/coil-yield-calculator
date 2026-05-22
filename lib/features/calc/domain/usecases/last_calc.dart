import 'package:coil_yield_calculator/core/usecases/usecase.dart';
import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:coil_yield_calculator/features/calc/domain/repo/i_calc_repo.dart';

class LastCalc implements Usecase<NoParams, CalcEntity> {
  final ICalcRepo _repo;
  LastCalc({required repo}) : _repo = repo;
  @override
  ReturnFuture<CalcEntity> call(NoParams params) async {
    final result = await _repo.lastCalc(params);

    return result;
  }
}

class NoParams {}
