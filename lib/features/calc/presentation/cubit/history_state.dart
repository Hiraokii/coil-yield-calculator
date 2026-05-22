part of 'history_cubit.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistoryError extends HistoryState {
  final String errorMsg;
  HistoryError({required this.errorMsg});
}

final class HistoryLoaded extends HistoryState {
  final List<CalcEntity> list;
  HistoryLoaded({required this.list});
}
