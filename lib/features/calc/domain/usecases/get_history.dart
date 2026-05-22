import 'package:coil_yield_calculator/core/usecases/usecase.dart';
import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:coil_yield_calculator/features/calc/domain/repo/i_calc_repo.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/last_calc.dart';

class GetHistory implements Usecase<NoParams, List<CalcEntity>> {
  final ICalcRepo _repo;
  GetHistory({required repo}) : _repo = repo;
  @override
  ReturnFuture<List<CalcEntity>> call(NoParams params) async {
    final result = await _repo.getHistory(params);
    return result;
  }
}
