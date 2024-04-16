class AccountData{

  String? firstName;
  String? lastName;
  String? email;
  String? password;

  AccountData({this.firstName, this.lastName, this.email, this.password});

  @override
  String toString() {
    return 'AccountData{firstName: $firstName, lastName: $lastName, email: $email, password: $password}';
  }
}