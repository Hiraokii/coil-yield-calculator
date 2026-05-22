import 'package:coil_yield_calculator/core/style/header_style.dart';
import 'package:coil_yield_calculator/core/widgets/call_to_action_button.dart';
import 'package:coil_yield_calculator/features/calc/domain/entities/calc_entity.dart';
import 'package:coil_yield_calculator/features/calc/presentation/pages/new_calc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastCalculationCard extends StatelessWidget {
  final CalcEntity? entity;
  LastCalculationCard({this.entity, super.key});

  final DateTime data = DateTime.now();

  Widget _buildLoadingDots() {
    return const Text(
      '...',
      style: TextStyle(fontSize: 24, color: Colors.white, height: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: BoxBorder.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.transparent, Colors.transparent],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Last Calculation', style: HeaderStyle.h2()),
                  entity != null
                      ? Text(
                          '${entity!.date.year}/${entity!.date.month.toString().padLeft(2, '0')}/${entity!.date.day.toString().padLeft(2, '0')}',
                          style: HeaderStyle.h2(),
                        )
                      : Text('--/--/--', style: HeaderStyle.h2()),
                ],
              ),
              SizedBox(height: 30),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            'Estimated Pieces',
                            style: HeaderStyle.h6(),
                          ),
                        ),
                        Padding(padding: EdgeInsetsGeometry.all(8)),
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              entity != null
                                  ? Text(
                                      entity!.piecesQnty.toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    )
                                  : _buildLoadingDots(),
                              Text(
                                ' pcs',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    VerticalDivider(color: Colors.grey),

                    Column(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            'Total Roll Length',
                            style: HeaderStyle.h6(),
                          ),
                        ),
                        Padding(padding: EdgeInsetsGeometry.all(8)),
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              entity != null
                                  ? Text(
                                      (entity!.materialLength! / 1000)
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    )
                                  : _buildLoadingDots(),
                              Text(
                                ' m',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsetsGeometry.all(8)),
              CallToActionButton(
                text: 'New Calculation',
                action: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return NewCalc();
                    },
                  );
                },
                width: 330,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
