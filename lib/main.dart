import 'package:coil_yield_calculator/core/dependencies/injection.dart' as di;
import 'package:coil_yield_calculator/features/calc/presentation/bloc/last_calc_bloc.dart';
import 'package:coil_yield_calculator/features/calc/presentation/cubit/history_cubit.dart';
import 'package:coil_yield_calculator/features/calc/presentation/pages/history.dart';
import 'package:coil_yield_calculator/features/dashboard/presentation/pages/bottom_menu.dart';
import 'package:coil_yield_calculator/features/dashboard/presentation/pages/dashboard.dart';
import 'package:coil_yield_calculator/features/dashboard/presentation/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int menuIndex = 0;

  List<Widget> pages = [
    Dashboard().animate().fade(duration: 500.ms),
    History().animate().fade(duration: 500.ms),
    Settings().animate().fade(duration: 500.ms),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<LastCalcBloc>()..add(LastCalcRequested()),
        ),
        BlocProvider(create: (context) => di.sl<HistoryCubit>()..getHistory()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            ],
          ),
          extendBodyBehindAppBar: true,
          extendBody: true,

          bottomNavigationBar: BottomMenu(
            currentIndex: menuIndex,
            onChanged: (index) {
              setState(() {
                menuIndex = index;
              });
            },
          ),
          body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0D47A1), Colors.black],
              ),
            ),
            child: SafeArea(child: pages[menuIndex]),
          ),
        ),
      ),
    );
  }
}
