// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../Bloc/movies_bloc/movies_bloc.dart';
// import '../Bloc/movies_bloc/movies_event.dart';
// import '../Bloc/search_bloc/search_bloc.dart';
// import '../utlis/bottom_bar.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 4), () {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) => MultiBlocProvider(
//                     providers: [
//                       BlocProvider(
//                         create: (context) =>
//                             MovieBloc()..add(FetchMoviesEvent()),
//                       ),
//                       BlocProvider(
//                         create: (context) => SearchBloc(),
//                       ),
//                     ],
//                     child: const BottomBar(),
//                   )));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Image.asset('assets/icon/image.png'),
//       ),
//     );
//   }
// }
