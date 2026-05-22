import 'package:coil_yield_calculator/features/calc/presentation/pages/history.dart';
import 'package:coil_yield_calculator/features/calc/presentation/pages/last_calc_builder.dart';
import 'package:coil_yield_calculator/features/dashboard/presentation/pages/header.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Header(), LastCalcBuilder(), History()],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(height: MediaQuery.of(context).size.height * 0.2),
    );
  }
}
