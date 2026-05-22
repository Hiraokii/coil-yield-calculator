import 'package:bloc/bloc.dart';
import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/get_history.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/last_calc.dart';
import 'package:meta/meta.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final GetHistory usecase;
  HistoryCubit({required this.usecase}) : super(HistoryInitial());

  Future<void> getHistory() async {
    emit(HistoryLoading());
    final result = await usecase(NoParams());
    result.fold(
      (failure) => emit(HistoryError(errorMsg: failure.errorMsg)),
      (list) => emit(HistoryLoaded(list: list)),
    );
  }
}
