import 'package:demo_app/core/shared_preferences.dart';
import 'package:demo_app/cubit/counter/counter_cubit.dart';
import 'package:demo_app/cubit/theme/theme_cubit.dart';
import 'package:demo_app/cubit/theme/theme_state.dart';
import 'package:demo_app/presentation/screens/counter.dart';
import 'package:demo_app/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit()..loadTheme(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          ThemeData themeData = ThemeData.light();

          if (state is ThemeLoaded || state is ToggleThemeState) {
            themeData = (state as dynamic).theme;
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: const CounterScreen(),
          );
        },
      ),
    );
  }
}
