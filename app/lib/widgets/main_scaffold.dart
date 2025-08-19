import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final VoidCallback? onToggleTheme;

  const MainScaffold({
    Key? key,
    required this.child,
    required this.title,
    this.onToggleTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Menu Patient', style: TextStyle(fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
                context.go('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Mes Rendez-vous'),
              onTap: () {
                Navigator.pop(context);
                context.go('/appointments');
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder_shared),
              title: const Text('Dossier Médical'),
              onTap: () {
                Navigator.pop(context);
                context.go('/dossier');
              },
            ),
            ListTile(
              leading: const Icon(Icons.lightbulb),
              title: const Text('Recommandations Santé'),
              onTap: () {
                Navigator.pop(context);
                context.go('/recommandations');
              },
            ),
            if (onToggleTheme != null)
              IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: onToggleTheme,
              ),
          ],
        ),
      ),
      body: child,
    );
  }
}
