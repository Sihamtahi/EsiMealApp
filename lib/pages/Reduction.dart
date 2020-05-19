import 'Client.dart';
import 'CommandClass.dart';

abstract class ReductionHandler
{
  ReductionHandler _suivant ;
  void setSuivant(ReductionHandler handler)
  {
    this._suivant = handler;
  }
  ReductionHandler getSuivant ()
  {
    return(this._suivant);
  }
  double calculerReduction(Client client , Commande comande );

}

class ReductionEtudiant extends ReductionHandler
{
   double calculerReduction(Client client , Commande commande )
   {
        double taux= 0;
        if (client is Etudiant )
          {
               taux = taux + 8;

          }
          if ( client is ClientFid)
            {

              if (client.getClient() is Etudiant)
                {
                  taux = taux +8;
                }

            }
            if (_suivant != null )
              {
                taux = taux + _suivant.calculerReduction(client, commande);
              }
        return taux;

   }
}
class ReductionFid extends ReductionHandler
{
  double calculerReduction(Client client , Commande commande )
  {
    double taux= 0;
    if (client is ClientFid )
    {
          taux = taux + 5;
    }
    if ( client is Etudiant)
      {
        if (client.getClient() is ClientFid)
          {
            taux = taux + 5;
          }
      }
    if (_suivant != null )
    {
      taux = taux + _suivant.calculerReduction(client, commande);
    }
    return taux;
  }
}
class ReductionDomicile extends ReductionHandler
{
  double calculerReduction(Client client, Commande commande) {
    double taux = 0;
    if ((commande is LivreeDomicile) && (commande.nbrPersonnes >= 4))
    {
      taux = taux + 5;
    }
    if (_suivant != null )
    {
      taux = taux + _suivant.calculerReduction(client, commande);
    }
    return taux;
  }
}
class ReductionEvenement extends ReductionHandler
{
  double calculerReduction(Client client, Commande commande) {
    double taux = 0;
    if ((commande is Event) && (commande.nbrPersonnes >= 50))
    {
      taux = taux + 10;
    }
    if (_suivant != null )
    {
      taux = taux + _suivant.calculerReduction(client, commande);
    }
    return taux;
  }
}
