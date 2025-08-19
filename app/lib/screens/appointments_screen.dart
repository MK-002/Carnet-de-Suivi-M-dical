import 'package:flutter/material.dart';
import '../models/patient.dart';
import '../widgets/appointment_card.dart';

class AppointmentsScreen extends StatelessWidget {
  final List<RendezVous> rendezVousList = [
    RendezVous(
      medecin: "Dr. Ali",
      specialite: "Cardiologue",
      date: "2025-08-20",
    ),
    RendezVous(
      medecin: "Dr. Sarah",
      specialite: "Dermatologue",
      date: "2025-08-25",
    ),
  ];

  AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 16, bottom: 16),
              title: Text(
                "Mes Rendez-vous",
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
                children: rendezVousList
                    .map((rendezVous) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: AppointmentCard(rendezVous: rendezVous),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
