import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/get_history.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/last_calc.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/clear_history.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final GetHistory getHistoryUsecase;
  final ClearHistory clearHistoryUsecase;
  HistoryCubit({required this.getHistoryUsecase, required this.clearHistoryUsecase}) : super(HistoryInitial());

  Future<void> getHistory() async {
    emit(HistoryLoading());
    final result = await getHistoryUsecase(NoParams());
    result.fold(
      (failure) => emit(HistoryError(errorMsg: failure.errorMsg)),
      (list) => emit(HistoryLoaded(list: list)),
    );
  }

  Future<void> resetHistory() async {
    emit(HistoryLoading());
    final result = await clearHistoryUsecase(NoParams());
    result.fold(
      (failure) => emit(HistoryError(errorMsg: failure.errorMsg)),
      (_) => emit(HistoryInitial()),
    );
  }
}
