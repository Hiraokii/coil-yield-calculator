part of 'add_calc_cubit.dart';

@immutable
sealed class AddCalcState {}

final class AddCalcInitial extends AddCalcState {}

final class AddCalcLoading extends AddCalcState {}

final class AddCalcError extends AddCalcState {
  final String errorMsg;
  AddCalcError({required this.errorMsg});
}

final class AddCalcSuccess extends AddCalcState {}
