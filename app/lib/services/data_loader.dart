import 'dart:convert';
import 'package:app/models/appointment.dart';
import 'package:app/models/dossier.dart';
import 'package:flutter/services.dart';
import '../models/patient.dart';
import '../models/recommandation.dart';

class DataLoader {
  
  static Future<Patient> loadPatient() async {
    final data = await rootBundle.loadString('assets/patient.json');
    return Patient.fromJson(json.decode(data));
  }

  static Future<List<Recommandation>> loadRecommandations() async {
    final jsonStr = await rootBundle.loadString('assets/recommandations.json');
    final List data = json.decode(jsonStr);
    return data.map((e) => Recommandation.fromJson(e)).toList();
  }

    static Future<List<Appointment>> loadAppointments() async {
    final String response = await rootBundle.loadString('assets/rendezvous.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Appointment.fromJson(json)).toList();
  }

  static Future<Dossier> loadDossier() async {
    final data = await rootBundle.loadString('assets/dossier.json');
    final jsonResult = json.decode(data);
    return Dossier.fromJson(jsonResult);
  }
}
