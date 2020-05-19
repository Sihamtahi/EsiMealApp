
class Reservation{
  int _nbTableinterne;
  int _nbtableexterne;
  int _nbTableinterneLibre;



  int get nbTableinterneLibre => _nbTableinterneLibre;

  set nbTableinterneLibre(int value) {
    _nbTableinterneLibre = value;
  }

  int get nbtableexterneLibre => _nbtableexterneLibre;

  set nbtableexterneLibre(int value) {
    _nbtableexterneLibre = value;
  }

  int _nbtableexterneLibre;


  int get nbtableexterne => _nbtableexterne;

  set nbtableexterne(int value) {
    _nbtableexterne = value;
  }

  int _nbChaiseinterne;
  int _nbChaiseinterneLibre;

  int get nbChaiseinterneLibre => _nbChaiseinterneLibre;

  set nbChaiseinterneLibre(int value) {
    _nbChaiseinterneLibre = value;
  }

  int get nbChaiseinterne => _nbChaiseinterne;

  set nbChaiseinterne(int value) {
    _nbChaiseinterne = value;
  }

  int _nbChaiseexterne;
  int _nbChaiseexterneLibre;

  int get nbChaiseexterneLibre => _nbChaiseexterneLibre;

  set nbChaiseexterneLibre(int value) {
    _nbChaiseexterneLibre = value;
  }

  int get nbChaiseexterne => _nbChaiseexterne;

  set nbChaiseexterne(int value) {
    _nbChaiseexterne = value;
  }

  int get nbTableinterne => _nbTableinterne;

  set nbTableinterne(int value) {
    _nbTableinterne = value;
  }

  static final Reservation _singleton = Reservation._internal();
  factory Reservation() => _singleton;

  Reservation._internal();
  afficher(){
    print(nbChaiseexterne);
  }
}