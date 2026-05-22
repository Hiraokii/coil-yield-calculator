import 'package:bloc/bloc.dart';
import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/last_calc.dart';
import 'package:meta/meta.dart';

part 'last_calc_event.dart';
part 'last_calc_state.dart';

class LastCalcBloc extends Bloc<LastCalcEvent, LastCalcState> {
  final LastCalc usecase;
  LastCalcBloc({required this.usecase}) : super(LastCalcInitial()) {
    on<LastCalcRequested>(_lastCalcRequested);
  }

  void _lastCalcRequested(
    LastCalcRequested event,
    Emitter<LastCalcState> emit,
  ) async {
    final result = await usecase(NoParams());
    result.fold(
      (failure) => emit(LastCalcError(msg: failure.errorMsg)),
      (calc) => emit(LastCalcLoaded(entity: calc)),
    );
  }
}
