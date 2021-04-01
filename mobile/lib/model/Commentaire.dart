class Commentaire{
  final String id;
  final String texte;
  final String lien;
  final DateTime created_at;
  final DateTime updated_at;

  Commentaire({
    this.id,
    this.texte,
    this.lien,
    this.created_at,
    this.updated_at
  });
}