class Friend {
  int id;
  String name;
  String number;

  Friend( String name, String number) {
    this.name = name;
    this.number = number;
  }


  @override
  String toString() {
    return 'Sms{id: $id, number: $number, name: $name,}';
  }


  Friend.fromMap(Map<String, dynamic> res)
      : name = res["name"],
        number = res["number"];

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['number'] = number;
    map['name'] = name;
    return map;
  }
}

