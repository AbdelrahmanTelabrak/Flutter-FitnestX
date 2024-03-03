import '../../common/enums/gender.dart';
import '../../common/enums/programs.dart';

class PersonalData{
  
  Gender _gender;
  String _birthday;
  double _weight;
  double _height;
  Goals? goal;

  PersonalData(this._gender, this._birthday, this._weight, this._height, this.goal);

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
}