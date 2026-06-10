import 'package:coil_yield_calculator/features/calc/data/repo/calc_repo_imp.dart';
import 'package:coil_yield_calculator/features/calc/data/source/calc_source.dart';
import 'package:coil_yield_calculator/features/calc/domain/repo/i_calc_repo.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/calculate_yield.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/clear_history.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/get_history.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/last_calc.dart';
import 'package:coil_yield_calculator/features/calc/presentation/bloc/last_calc_bloc.dart';
import 'package:coil_yield_calculator/features/calc/presentation/cubit/add_calc_cubit.dart';
import 'package:coil_yield_calculator/features/calc/presentation/cubit/history_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // init hive
  await Hive.initFlutter();
  final calcBox = await Hive.openBox('calcs');
  sl.registerLazySingleton<Box>(() => calcBox);

  // Ads helper registration

  // feature calc
  // bloc
  sl.registerLazySingleton<LastCalcBloc>(
    () => LastCalcBloc(usecase: sl<LastCalc>()),
  );
  // usecases
  sl.registerLazySingleton<CalculateYield>(
    () => CalculateYield(repo: sl<ICalcRepo>()),
  );
  sl.registerLazySingleton<LastCalc>(() => LastCalc(repo: sl<ICalcRepo>()));
  // repo
  sl.registerLazySingleton<ICalcRepo>(
    () => CalcRepoImp(source: sl<ICalcSource>()),
  );
  // source
  sl.registerLazySingleton<ICalcSource>(() => CalcSource(box: sl<Box>()));

  // new calc form cubit
  sl.registerFactory<AddCalcCubit>(
    () => AddCalcCubit(calculateYield: sl<CalculateYield>()),
  );

  sl.registerLazySingleton<ClearHistory>(
    () => ClearHistory(repo: sl<ICalcRepo>()),
  );

  sl.registerLazySingleton<HistoryCubit>(
    () => HistoryCubit(
      getHistoryUsecase: sl<GetHistory>(),
      clearHistoryUsecase: sl<ClearHistory>(),
    ),
  );

  sl.registerLazySingleton<GetHistory>(() => GetHistory(repo: sl<ICalcRepo>()));
}
