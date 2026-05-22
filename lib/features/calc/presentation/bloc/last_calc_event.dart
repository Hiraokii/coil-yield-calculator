part of 'last_calc_bloc.dart';

@immutable
sealed class LastCalcEvent {}

class LastCalcRequested extends LastCalcEvent {}
