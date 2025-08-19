class Recommandation {
  final String categorie;
  final String titre;
  final String description;

  Recommandation({
    required this.categorie,
    required this.titre,
    required this.description,
  });

  factory Recommandation.fromJson(Map<String, dynamic> json) {
    return Recommandation(
      categorie: json['categorie'],
      titre: json['titre'],
      description: json['description'],
    );
  }
}
