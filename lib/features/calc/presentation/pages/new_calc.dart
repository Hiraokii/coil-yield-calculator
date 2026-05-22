import 'dart:ui';

import 'package:coil_yield_calculator/core/dependencies/injection.dart';
import 'package:coil_yield_calculator/core/widgets/call_to_action_button.dart';
import 'package:coil_yield_calculator/features/calc/presentation/bloc/last_calc_bloc.dart';
import 'package:coil_yield_calculator/features/calc/presentation/cubit/add_calc_cubit.dart';
import 'package:coil_yield_calculator/features/calc/presentation/cubit/history_cubit.dart';
import 'package:coil_yield_calculator/features/calc/presentation/dto/calc_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCalc extends StatefulWidget {
  const NewCalc({super.key});

  @override
  State<NewCalc> createState() => _NewCalcState();
}

class _NewCalcState extends State<NewCalc> {
  late final TextEditingController innerController;
  late final TextEditingController outerController;
  late final TextEditingController thicknessController;
  late final TextEditingController pitchController;

  @override
  void initState() {
    super.initState();
    innerController = TextEditingController();
    outerController = TextEditingController();
    thicknessController = TextEditingController();
    pitchController = TextEditingController();
  }

  @override
  void dispose() {
    innerController.dispose();
    outerController.dispose();
    thicknessController.dispose();
    pitchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddCalcCubit>(),
      child: BlocConsumer<AddCalcCubit, AddCalcState>(
        listener: (context, state) {
          if (state is AddCalcError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
          if (state is AddCalcSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('New calc added')));
            //trigger the lastcalc bloc
            context.read<LastCalcBloc>().add(LastCalcRequested());
            context.read<HistoryCubit>().getHistory();
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          final bool loading = state is AddCalcLoading;

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blueGrey),
                        color: Colors.white.withAlpha(20),
                      ),
                      child: Column(
                        children: [
                          _textField(
                            controller: outerController,
                            prefix: 'Outer diameter:',
                            sufix: 'mm',
                            icon: Icon(Icons.trip_origin),
                          ),
                          _textField(
                            controller: innerController,
                            prefix: 'Inner diameter:',
                            sufix: 'mm',
                            icon: Icon(Icons.radio_button_unchecked),
                          ),
                          _textField(
                            controller: thicknessController,
                            prefix: 'Thickness:',
                            sufix: 'mm',
                            icon: Icon(Icons.height),
                          ),
                          _textField(
                            controller: pitchController,
                            prefix: 'Pitch:',
                            sufix: 'mm',
                            icon: Icon(Icons.space_bar),
                          ),
                          SizedBox(
                            child: loading
                                ? CircularProgressIndicator()
                                : CallToActionButton(
                                    text: loading
                                        ? 'Calculating...'
                                        : 'Calculate Yield',
                                    action: () {
                                      final CalcDto dto = CalcDto(
                                        innerDiameter: innerController.text,
                                        outerDiameter: outerController.text,
                                        thickness: thicknessController.text,
                                        pitch: pitchController.text,
                                      );
                                      context.read<AddCalcCubit>().submit(dto);
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _textField({
    required TextEditingController controller,
    required String prefix,
    required String sufix,
    required Icon icon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        child: Card(
          color: Colors.white.withAlpha(30),
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 12.0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              maxLines: 1,
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                prefix: Padding(
                  padding: EdgeInsetsGeometry.only(left: 8),
                  child: Text(
                    prefix,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(sufix, style: TextStyle(color: Colors.white)),
                ),
                iconColor: Colors.blue,
                icon: icon,
                border: InputBorder.none,
                filled: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
