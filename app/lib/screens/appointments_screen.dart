import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../widgets/appointment_card.dart';
import '../models/patient.dart';
import '../models/appointment.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  late Future<List<Appointment>> futureAppointments;

  @override
  void initState() {
    super.initState();
    futureAppointments = loadAppointments();
  }

  static Future<List<Appointment>> loadAppointments() async {
    final String response =
        await rootBundle.loadString('assets/rendezvous.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Appointment.fromJson(json)).toList();
  }

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
              child: FutureBuilder<List<Appointment>>(
                future: futureAppointments,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Erreur: ${snapshot.error}");
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text("Aucun rendez-vous trouvé");
                  } else {
                    final appointments = snapshot.data!;

                    final rendezVousList = appointments.map((a) {
                      return RendezVous(
                        medecin: a.nomDocteur,
                        specialite: a.specialite,
                        date: a.date.toIso8601String(),
                      );
                    }).toList();

                    return Column(
                      children: rendezVousList
                          .map((rendezVous) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: AppointmentCard(rendezVous: rendezVous),
                              ))
                          .toList(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
