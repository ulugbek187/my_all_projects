import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/repositories/book_repo.dart';
import 'package:my_all_projects/screens/library/library_screen.dart';
import 'package:my_all_projects/screens/login_screen/login_screen.dart';
import 'package:my_all_projects/virebase_options.dart';
import 'package:provider/provider.dart';
import 'view_models/book_view_model.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookViewModel(
            productRepo: Repository(),
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
      designSize: const Size(375, 812),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
            ),
          ),
          home: child,
        );
      },
      child: const LoginScreen(),
    );
  }
}




class LoginViewModel extends ChangeNotifier {
  String email = "";
  String password = "";

  updateEmail(String v) {
    email = v;
  }

  updatePassword(String v) {
    password = v;
  }

  login(BuildContext context) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.uid.isNotEmpty) {
        debugPrint("UID:${credential.user!.uid}");
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const LibraryScreen();
        }));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
