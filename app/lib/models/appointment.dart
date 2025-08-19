class Appointment {
  final String nomDocteur;
  final String specialite;
  final DateTime date;
  final String location;
  final String status;

  Appointment({
    required this.nomDocteur,
    required this.specialite,
    required this.date,
    required this.location,
    required this.status,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      nomDocteur: json['NomDocteur'],
      specialite: json['specialite'],
      date: DateTime.parse(json['date']),
      location: json['location'],
      status: json['status'],
    );
  }
}
