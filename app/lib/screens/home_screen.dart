import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/patient.dart';
import '../models/recommandation.dart';
import '../services/data_loader.dart';
import '../widgets/appointment_card.dart';
import '../widgets/health_tip_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Patient? patient;
  Recommandation? recommandation;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final loadedPatient = await DataLoader.loadPatient();
    final loadedRecommandations = await DataLoader.loadRecommandations();
    setState(() {
      patient = loadedPatient;
      recommandation = (loadedRecommandations..shuffle()).first;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (patient == null || recommandation == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFF5F9FC),
        appBar: AppBar(
          title: const Text('Accueil', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF6BB1E3),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6BB1E3)),
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120.0,
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              title: Text('Bonjour ${patient!.prenom} 👋',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  )),
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
                  const SizedBox(height: 8),
                  _buildSectionTitle('🩺 Dernier rendez-vous'),
                  const SizedBox(height: 12),
                  AppointmentCard(rendezVous: patient!.dernierRendezVous),
                  const SizedBox(height: 24),
                  _buildSectionTitle('💡 Conseil santé du jour'),
                  const SizedBox(height: 12),
                  HealthTipCard(recommandation: recommandation!),
                  const SizedBox(height: 32),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7BC2F0), Color(0xFF5A9FD6)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () => context.go('/appointments'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Voir mes rendez-vous",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF2C73A6),
      ),
    );
  }
}
