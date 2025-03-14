import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/rectangle_bloc.dart';
import 'bloc/circle_bloc.dart';
import 'bloc/cube_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RectangleBloc>(
          create: (context) => RectangleBloc(),
        ),
        BlocProvider<CircleBloc>(
          create: (context) => CircleBloc(),
        ),
        BlocProvider<CubeBloc>(
          create: (context) => CubeBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Bangun Ruang Kalkulator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

