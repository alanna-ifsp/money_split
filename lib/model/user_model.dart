
class UserModel {
  String? _uid;
  String? _name; 
  int? _age; 
  String? _phoneNumber;
  String? _pix;
  String? _email; 


  UserModel([this._uid]);

  get getPhoneNumber => _phoneNumber;

  set setPhoneNumber( phoneNumber) => this._phoneNumber = phoneNumber;

  get getPix => _pix;

  set setPix( pix) => this._pix = pix;

  get getEmail => _email;
  
  set setEmail(email) => this._email =  email; 

  get getAge => _age;

  set setAge(age) => this._age = age;

  
  get getName => _name;

  set setName(name) => this._name = name;

  UserModel.fromMap(map){
    _uid = map["uid"];
    _name = map["name"];
    _age = map["age"];
    _phoneNumber =  map["phoneNumber"];
    _pix = map["pix"];
    _email =  map["email"];
  }

  toMap() {
    var map = <String, dynamic>{};
    map["uid"] = _uid;
    map["name"] = _name;
    map["age"] = _age; 
    map["phoneNumber"] = _phoneNumber;
    map["pix"] =  _pix;
    map["email"] = _email;

    return map;
  }


   UserModel.withData({name = "", age = 0,phoneNumber = "",pix = "",email = ""}) {
    _name = name;
    _phoneNumber = phoneNumber;
    _pix = pix; 
    _email = email;
    _age = age;
  }

}