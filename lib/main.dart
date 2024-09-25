import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/movies_bloc/movies_bloc.dart';
import 'Bloc/movies_bloc/movies_event.dart';
import 'Bloc/search_bloc/search_bloc.dart';
import 'screens/splash_screen.dart';
import 'utlis/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        secondaryHeaderColor: Colors.red,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MovieBloc()..add(FetchMoviesEvent()),
          ),
          BlocProvider(
            create: (context) => SearchBloc(),
          ),
        ],
        child: const BottomBar(),
      ),
    );
  }
}
