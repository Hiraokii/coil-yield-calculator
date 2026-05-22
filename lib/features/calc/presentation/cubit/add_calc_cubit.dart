import 'package:bloc/bloc.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/calculate_yield.dart';
import 'package:coil_yield_calculator/features/calc/presentation/dto/calc_dto.dart';
import 'package:meta/meta.dart';

part 'add_calc_state.dart';

class AddCalcCubit extends Cubit<AddCalcState> {
  final CalculateYield calculateYield;
  AddCalcCubit({required this.calculateYield}) : super(AddCalcInitial());
  Future<void> submit(CalcDto dto) async {
    emit(AddCalcLoading());
    final result = await calculateYield(dto);
    result.fold(
      (failure) => emit(AddCalcError(errorMsg: failure.errorMsg)),
      (_) => emit(AddCalcSuccess()),
    );
  }
}
