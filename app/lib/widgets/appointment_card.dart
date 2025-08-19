import 'package:flutter/material.dart';
import '../models/patient.dart';

class AppointmentCard extends StatelessWidget {
  final RendezVous rendezVous;

  const AppointmentCard({Key? key, required this.rendezVous}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${rendezVous.medecin} - ${rendezVous.specialite}'),
        subtitle: Text('Le ${rendezVous.date}'),
      ),
    );
  }
}
