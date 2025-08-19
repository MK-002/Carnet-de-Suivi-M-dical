import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app/theme/themes.dart';
import 'widgets/main_scaffold.dart';
import 'screens/home_screen.dart';
import 'screens/appointments_screen.dart';
import 'screens/dossier_screen.dart';
import 'screens/recommandations_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  late final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainScaffold(
          title: 'Accueil',
          child: HomeScreen(),
          onToggleTheme: toggleTheme,
        ),
      ),
      GoRoute(
        path: '/appointments',
        builder: (context, state) => MainScaffold(
          title: 'Mes Rendez-vous',
          child: AppointmentsScreen(),
          onToggleTheme: toggleTheme,
        ),
      ),
      GoRoute(
        path: '/dossier',
        builder: (context, state) => MainScaffold(
          title: 'Dossier Médical',
          child: DossierScreen(),
          onToggleTheme: toggleTheme,
        ),
      ),
      GoRoute(
        path: '/recommandations',
        builder: (context, state) => MainScaffold(
          title: 'Recommandations Santé',
          child: RecommandationsScreen(),
          onToggleTheme: toggleTheme,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portail Patient',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
