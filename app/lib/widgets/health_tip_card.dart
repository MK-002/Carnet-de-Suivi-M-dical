import 'package:flutter/material.dart';
import '../models/recommandation.dart';

class HealthTipCard extends StatelessWidget {
  final Recommandation recommandation;

  const HealthTipCard({super.key, required this.recommandation});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(recommandation.titre,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(recommandation.description),
        trailing: Text(
          recommandation.categorie,
          style: TextStyle(color: const Color.fromARGB(255, 4, 179, 248)),
        ),
      ),
    );
  }
}
