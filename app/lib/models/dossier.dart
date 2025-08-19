class Dossier {
  final List<String> antecedents;
  final List<String> allergies;
  final List<String> traitements;

  Dossier({
    required this.antecedents,
    required this.allergies,
    required this.traitements,
  });

  factory Dossier.fromJson(Map<String, dynamic> json) {
    return Dossier(
      antecedents: List<String>.from(json["antecedents"]),
      allergies: List<String>.from(json["allergies"]),
      traitements: List<String>.from(json["traitements"]),
    );
  }
}
