import 'package:coil_yield_calculator/core/usecases/usecase.dart';
import 'package:coil_yield_calculator/features/calc/domain/repo/i_calc_repo.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/last_calc.dart';

class ClearHistory implements Usecase<NoParams, void> {
  final ICalcRepo _repo;

  ClearHistory({required ICalcRepo repo}) : _repo = repo;

  @override
  ReturnFuture<void> call(NoParams params) async {
    return _repo.clearHistory(params);
  }
}
