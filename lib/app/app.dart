import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/currency/trans_actions_cubit.dart';
import '../cubits/timer/time_task_cubit.dart';
import '../data/repositories/currency_repository.dart';
import '../screens/helper/helper_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => TimerModel(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => TransActionsCubit(
              timerRepository: TimerModel(),
            )..fetchCurrencies(),
          ),
          BlocProvider(
            create: (_) => TimeTaskCubit(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HelperScreen(),
    );
  }
}
