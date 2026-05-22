part of 'last_calc_bloc.dart';

@immutable
sealed class LastCalcState {}

final class LastCalcInitial extends LastCalcState {}

final class LastCalcLoading extends LastCalcState {}

final class LastCalcLoaded extends LastCalcState {
  final CalcEntity entity;
  LastCalcLoaded({required this.entity});
}

final class LastCalcError extends LastCalcState {
  final String msg;
  LastCalcError({required this.msg});
}
