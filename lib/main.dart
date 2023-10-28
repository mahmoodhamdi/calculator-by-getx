import 'package:calculators/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:calculators/cubit/numbers_cubit.dart';
import 'package:calculators/screens/dark.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NumbersCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          DarkPage.id: (context) => const DarkPage(),
          HomeView.id: (context) => const HomeView()
        },
        initialRoute: HomeView.id,
      ),
    );
  }
}
