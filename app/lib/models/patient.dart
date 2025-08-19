class Patient {
  final String prenom;
  final RendezVous dernierRendezVous;

  Patient({required this.prenom, required this.dernierRendezVous});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      prenom: json['prenom'],
      dernierRendezVous: RendezVous.fromJson(json['dernierRendezVous']),
    );
  }
}

class RendezVous {
  final String medecin;
  final String specialite;
  final String date;

  RendezVous({required this.medecin, required this.specialite, required this.date});

  factory RendezVous.fromJson(Map<String, dynamic> json) {
    return RendezVous(
      medecin: json['medecin'],
      specialite: json['specialite'],
      date: json['date'],
    );
  }
}
