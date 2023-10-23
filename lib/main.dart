// ignore_for_file: overridden_fields

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jankenpon_app/blocs/auth_bloc.dart';
import 'package:jankenpon_app/firebase_options.dart';
import 'package:jankenpon_app/screen/auth_screen.dart';
import 'package:jankenpon_app/screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
      AuthBloc(),
      MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const AuthScreen(),
          '/home': (context) => const HomeScreen(),
        },
      )));
}

class MyApp extends InheritedWidget {
  final AuthBloc bloc;
  @override
  final Widget child;
  // ignore: use_key_in_widget_constructors
  const MyApp(this.bloc, this.child) : super(child: child);

  // This widget is the root of your application.
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static MyApp? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyApp>();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
