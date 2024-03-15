import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/screens/global_screen/global_screen.dart';
import 'package:my_all_projects/view_models/first_view_model.dart';
import 'package:my_all_projects/view_models/second_view_model.dart';
import 'package:provider/provider.dart';

import 'data/repositories/first_repo.dart';
import 'data/repositories/second_repo.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FirstViewModel(
            firstRepo: FirstRepo(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SecondViewModel(
            secondRepo: SecondRepo(),
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
    return ScreenUtilInit(
      designSize: const Size(
        326,
        812,
      ),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.grey,
          ),
          home: child,
        );
      },
      child: const GlobalScreen(),
    );
  }
}
