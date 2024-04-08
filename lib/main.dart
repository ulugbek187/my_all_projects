import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/blocs/books_bloc.dart';
import 'package:my_all_projects/blocs/books_event.dart';
import 'package:my_all_projects/data/repositories/books_repository.dart';
import 'package:my_all_projects/screens/global_screen/global_screen.dart';
import 'package:my_all_projects/utils/colors/app_colors.dart';
import 'data/api_provider/api_provider.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = ApiProvider();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => BooksRepository(
            apiProvider: apiProvider,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BooksBloc(
              booksRepository: context.read<BooksRepository>(),
            )..add(
                GetBooksEvent(),
              ),
          )
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) =>
      ScreenUtilInit(
        designSize: const Size(
          375,
          812,
        ),
        builder: (context, child) {
          ScreenUtil.init(
            context,
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: false,
              scaffoldBackgroundColor: AppColors.white,
            ),
            home: child,
          );
        },
        child: const GlobalScreen(),
      );
}
