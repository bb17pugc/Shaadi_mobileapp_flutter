

import 'AppUser.dart';

class UserNotification {
  late final int id;
  late final dynamic to_user ;
  late final dynamic from_user;
  late final String description;
  late final int status;
  late final int type;
  late final String data;
  late final dynamic created_at;


  UserNotification({
    required this.id,
    required this.to_user,
    required this.from_user,
    required this.description,
    required this.status,
    required this.type,
    required this.created_at,
    required this.data,

  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> notification = Map<String, dynamic>();
    notification["id"] = this.id;
    notification["to_user"] = this.to_user;
    notification["from_user"] = this.from_user;
    notification["description"] = this.description;
    notification["status"] = this.status;
    notification["type"] = this.type;
    notification["created_at"] = this.created_at;
    notification["data"] = this.data;
    return notification;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> notification = Map<String, dynamic>();
    notification["id"] = this.id;
    notification["to_user"] = this.to_user;
    notification["from_user"] = this.from_user;
    notification["description"] = this.description;
    notification["status"] = this.status;
    notification["type"] = this.type;
    notification["created_at"] = this.created_at;
    notification["data"] = this.data;
    return notification;
  }


  factory UserNotification.fromJson(Map<String, dynamic> parsedJson){
    return UserNotification(
      id: int.parse(parsedJson['id'].toString()),
      to_user : parsedJson['to_user'] is int ? parsedJson['to_user'] :  AppUser.fromJson(parsedJson['to_user']),
      from_user: parsedJson['from_user'] is int ? parsedJson['from_user'] :  AppUser.fromJson(parsedJson['from_user']),
     description: parsedJson['description'].toString(),
      status: int.parse(parsedJson['status'].toString()),
      type: int.parse(parsedJson['type'].toString()),
      created_at: parsedJson['created_at'].toString(),
      data: parsedJson['data'].toString(),

    );
  }
}
