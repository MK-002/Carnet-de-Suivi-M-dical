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
          onToggleTheme: toggleTheme,
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/appointments',
        builder: (context, state) => MainScaffold(
          title: 'Mes Rendez-vous',
          onToggleTheme: toggleTheme,
          child: AppointmentsScreen(),
        ),
      ),
      GoRoute(
        path: '/dossier',
        builder: (context, state) => MainScaffold(
          title: 'Dossier Médical',
          onToggleTheme: toggleTheme,
          child: DossierScreen(),
        ),
      ),
      GoRoute(
        path: '/recommandations',
        builder: (context, state) => MainScaffold(
          title: 'Recommandations Santé',
          onToggleTheme: toggleTheme,
          child: RecommandationsScreen(),
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
