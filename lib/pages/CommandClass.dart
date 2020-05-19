import 'package:marketing_app/ListDishes/dataModels.dart';

abstract class Commande {
  int ID;
  double prix;
  double prixReduction;
  bool isDispo;
  int nbrPersonnes;
  DateTime date;
  List<Order> orders;

  Commande(int ID,double prix,double prixReduction,bool isDispo,int nbrPersonnes,DateTime date,  List<Order> orders){
    this.ID=ID;
    this.prix=prix;
    this.prixReduction=prixReduction;
    this.isDispo=isDispo;
    this.nbrPersonnes=nbrPersonnes;
    this.date=date;
    this.orders=orders;
  }
  valider();
  verifier_date();
  verifier_heure();

}


class LivreeDomicile extends Commande {
  double distance;
  String addresse;

  LivreeDomicile(int ID, double prix, double prixReduction, bool isDispo, int nbrPersonnes, DateTime date, List<Order> orders,double distance, String addresse) : super(ID, prix, prixReduction,isDispo,nbrPersonnes,date,orders)  {
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

  ConsomResto(int ID, double prix, double prixReduction, bool isDispo, int nbrPersonnes, DateTime date, List<Order> orders,int nbchaise,int nbtable) : super(ID, prix, prixReduction, isDispo, nbrPersonnes, date,orders){
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
  Event(int ID, double prix, double prixReduction, bool isDispo, int nbrPersonnes, DateTime date, List<Order> orders) : super(ID, prix, prixReduction, isDispo, nbrPersonnes, date,orders);

  @override
  valider() {
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