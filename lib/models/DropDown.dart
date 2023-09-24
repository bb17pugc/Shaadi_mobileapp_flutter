

class DropDown {
  late final int id;
  late final String name;


  DropDown({
    required this.id,
    required this.name,

  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dropDown = Map<String, dynamic>();
    dropDown["id"] = this.id;
    dropDown["name"] = this.name;
    return dropDown;
  }


  factory DropDown.fromJson(Map<String, dynamic> parsedJson){
    return DropDown(
      id: parsedJson['id'],
      name : parsedJson['name']
    );
  }
}
