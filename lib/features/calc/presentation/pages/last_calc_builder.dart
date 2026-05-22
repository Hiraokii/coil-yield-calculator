import 'package:coil_yield_calculator/core/dependencies/injection.dart';
import 'package:coil_yield_calculator/features/calc/domain/usecases/last_calc.dart';
import 'package:coil_yield_calculator/features/calc/presentation/bloc/last_calc_bloc.dart';
import 'package:coil_yield_calculator/features/calc/presentation/widgets/last_calculation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastCalcBuilder extends StatelessWidget {
  const LastCalcBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LastCalcBloc, LastCalcState>(
      builder: (context, state) {
        return switch (state) {
          LastCalcInitial() => LastCalculationCard(),
          LastCalcLoading() => CircularProgressIndicator(),
          LastCalcLoaded() => LastCalculationCard(entity: state.entity),
          LastCalcError() => LastCalculationCard(),
        };
      },
      listener: (context, state) {
        if (state is LastCalcError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.msg),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
    );
  }
}
