abstract class Commande {
  int ID;
  double prix;
  double prixReduction;
  bool isDispo;
  int nbrPersonnes;
  DateTime date;
  Commande(int ID,double prix,double prixReduction,bool isDispo,int nbrPersonnes,DateTime date){
    this.ID=ID;
    this.prix=prix;
    this.prixReduction=prixReduction;
    this.isDispo=isDispo;
    this.nbrPersonnes=nbrPersonnes;
    this.date=date;
  }
  valider();
  verifier_date();
  verifier_heure();

}

class event extends Commande{
  event(int ID, double prix, double prixReduction, bool isDispo, int nbrPersonnes, DateTime date) : super(ID, prix, prixReduction, isDispo, nbrPersonnes, date);
  @override
  valider() {
    // TODO: implement valider
   print('commande validée');
  }

  @override
  verifier_date() {
    // TODO: implement verifier_date
    return null;
  }

  @override
  verifier_heure() {
    // TODO: implement verifier_heure
    return null;
  }
}

class LivreeDomicile extends Commande {
  double distance;
  String addresse;

  LivreeDomicile(int ID, double prix, double prixReduction, bool isDispo, int nbrPersonnes, DateTime date,double distance, String addresse) : super(0, 0.0, 0.0, false, 0, null)  {
    this.distance=distance;
    this.addresse=addresse;
  }

  @override
  valider() {
    // TODO: implement valider
    print("commande livree domicile validée");
  }

  @override
  verifier_date() {
    // TODO: implement verifier_date
    return null;
  }

  @override
  verifier_heure() {
    // TODO: implement verifier_heure
    return null;
  }

}
class ConsomResto extends Commande{
  int nbChaise;
  int nbTable;

  ConsomResto(int ID, double prix, double prixReduction, bool isDispo, int nbrPersonnes, DateTime date, int nbchaise,int nbtable) : super(ID, prix, prixReduction, isDispo, nbrPersonnes, date){
    this.nbChaise=nbchaise;
    this.nbTable=nbtable;
  }
  @override
  valider() {
    // TODO: implement valider
    return null;
  }

  @override
  verifier_date() {
    // TODO: implement verifier_date
    return null;
  }

  @override
  verifier_heure() {
    // TODO: implement verifier_heure
    return null;
  }

}
class Event extends Commande{
  Event(int ID, double prix, double prixReduction, bool isDispo, int nbrPersonnes, DateTime date) : super(ID, prix, prixReduction, isDispo, nbrPersonnes, date);

  @override
  valider() {
    // TODO: implement valider
    return null;
  }

  @override
  verifier_date() {
    // TODO: implement verifier_date
    return null;
  }

  @override
  verifier_heure() {
    // TODO: implement verifier_heure
    return null;
  }

}