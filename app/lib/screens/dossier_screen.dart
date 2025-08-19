import 'package:flutter/material.dart';
import '../services/data_loader.dart';
import '../models/dossier.dart';
import '../widgets/dossier_section.dart';

class DossierScreen extends StatelessWidget {
  const DossierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Dossier>(
        future: DataLoader.loadDossier(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6BB1E3)),
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Erreur de chargement des données",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Dossier introuvable"),
            );
          }

          final dossier = snapshot.data!;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 120.0,
                flexibleSpace: const FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                  title: Text(
                    "Dossier Médical",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                pinned: true,
                elevation: 1,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DossierSection(title: "Antécédents médicaux", items: dossier.antecedents),
                      const SizedBox(height: 24),
                      DossierSection(title: "Allergies", items: dossier.allergies),
                      const SizedBox(height: 24),
                      DossierSection(title: "Traitements en cours", items: dossier.traitements),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
