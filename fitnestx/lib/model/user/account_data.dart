class AccountData{

  String _firstName;
  String _lastName;
  String _email;
  String _password;

  AccountData(this._firstName, this._lastName, this._email, this._password);

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

  @override
  String toString() {
    return 'AccountData{_firstName: $_firstName, _lastName: $_lastName, _email: $_email, _password: $_password}';
  }
}