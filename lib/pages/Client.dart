abstract class Client
{
    String _name;
    String _lastname;
    String _address;
    String _phone;
    int _nbCmd;


    Client( String name , String lastname , String address, String phone, int nbCmd )
    {
      this._name = name ;
      this._lastname = lastname ;
      this._address = address;
      this._phone = phone;
      this._nbCmd = nbCmd;
    }

    String getName (){
      return this._name;
    }
    String getLastName (){
      return this._lastname;
    }
    String getAddress (){
      return this._address;
    }
    String getPhone (){
      return this._phone;
    }
    int getNbCmd (){
      return this._nbCmd;
    }
    void setName (String name )
    {
      this._name = name;
    }
    void setLastName (String lastname )
    {
      this._lastname = lastname;
    }
    void setAddress (String address )
    {
      this._address = address;
    }
    void setPhone (String phone )
    {
      this._phone = phone;
    }
    void setNbCmd (int nbCmd )
    {
      this._nbCmd = nbCmd;
    }


}
class ClientOrdinaire extends Client {
  ClientOrdinaire(String name, String lastname, String address, String phone, int nbCmd) : super(name, lastname, address, phone, nbCmd);
}
class Etudiant extends Client {
  String _carteEtude ;
  Client _client ;
  int _nbRed;
  Etudiant(String name, String lastname, String address, String phone, int nbCmd , String carteEtud) : super(name, lastname, address, phone, nbCmd)
  {
    this._carteEtude=carteEtud;
    _nbRed = 0;
  }
  int getNbREd ()
  {
    return _nbRed;
  }
  void setNbRed(int nbRed)
  {
     this._nbRed = nbRed;
  }
  Client getClient ()
  {
    return _client;
  }
  void setClient ( Client client )
  {
    this._client = client;
  }
}
class ClientFid extends Client{
  String _mail ;
  String _pwd ;
  Client _client;
  String _codeFid;
  List<String> _ListAddress ;
  int _nbRed;
  ClientFid(String name, String lastname, String address, String phone, int nbCmd,String mail , String pwd , String codeFid, List<String> list) : super(name, lastname, address, phone, nbCmd)
  {
      this._mail = mail ;
      this._pwd = pwd;
      this._codeFid=codeFid;
      this._ListAddress = list;
      this._nbRed =0;
  }
  int getNbREd () {
    return _nbRed;
  }
  String getMail ()
  {
    return _mail;
  }
  String getPwd ()
  {
    return _pwd;
  }
  String getCodeFid ()
  {
    return _codeFid;
  }

  Client getClient ()
  {
    return _client;
  }
  void setClient ( Client client )
  {
    this._client = client;
  }

  void setNbRed(int nbRed)
  {
    this._nbRed = nbRed;
  }
  void setMail ( String mail)
  {
     this._mail = mail;
  }
  void setPwd ( String pwd)
  {
    this._pwd = pwd;
  }
  void addAddress (String adr)
  {
    this._ListAddress.add(adr);
  }
  void removeAddress ( String adr)
  {
    this._ListAddress.remove(adr);
  }
}