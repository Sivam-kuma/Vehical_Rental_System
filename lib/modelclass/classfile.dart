
class Node{
  late int? _id;
  late String _name;
  late String _status;
  late int _amountnew;
  late int _date;

  Node(this._id, this._name, this._status,this._amountnew,this._date);
  Node.withId(this._id, this._name, this._status,this._amountnew,this._date);

  int? get id => _id;
  String get name => _name;
  String get status => _status;
  int get amountnew => _amountnew;
  int get date => _date;


  // Map <String , dynamic> toMap(){
  //
  //   var map=Map<String,dynamic>();
  //  if(id!=null) {
  //    map['id'] = _id;
  //  }
  //
  //   map['name']=_name;
  //   map['status']=_status;
  //   map['amountnew']=_amountnew;
  //   map['date']=_date;
  //
  //   return map;
  // }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': _name,
      'status': _status,
      'amountnew': _amountnew,
      'date': _date,
    };
    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Node.objectToMap(Map<String , dynamic> map){
    this._id=map['id'];
    this._name=map['name'];
    this._status=map['status'];
    this._amountnew=map['amountnew'];
    this._date=map['date'];
  }
}