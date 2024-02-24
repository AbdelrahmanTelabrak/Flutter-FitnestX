import '../../common/enums/gender.dart';

class UserData{

  String _firstName;
  String _lastName;
  String _email;
  String _password;
  Gender _gender;
  String _birthday;
  double _weight;
  double _height;

  UserData(this._firstName, this._lastName, this._email, this._password,
      this._gender, this._birthday, this._weight, this._height);

  double get height => _height;

  set height(double value) {
    _height = value;
  }

  double get weight => _weight;

  set weight(double value) {
    _weight = value;
  }

  String get birthday => _birthday;

  set birthday(String value) {
    _birthday = value;
  }

  Gender get gender => _gender;

  set gender(Gender value) {
    _gender = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }
}