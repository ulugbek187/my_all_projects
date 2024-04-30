import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_all_projects/data/local/local_storage.dart';
import 'package:my_all_projects/data/model/currency_model/currency_model.dart';
import 'package:my_all_projects/screen/currency_screen/home_screen.dart';
import 'package:my_all_projects/services/services_locator.dart';

import 'screen/bloc/currency_bloc.dart';
import 'screen/bloc/currency_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CurrencyModelAdapter());
  setUpDI();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CurrencyBloc(getIt<CurrencyController>())
            ..add(
              GetNetworkCurrencyEvent(),
            ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyScreen(),
    );
  }
}
