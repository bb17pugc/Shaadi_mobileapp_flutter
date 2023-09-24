import 'dart:convert';

import 'AppUser.dart';

class UserService {
  late final int id;
  late final String name;
  late final String city;
  late final String description;
  late final int price;
  final List images;

  late final Map<String , dynamic> location;
  late final int status;
  late final List types;
  late final app_users_id;
  late final String created_at;
  late final String updated_at;
  late final dynamic app_user;

  UserService({
    required this.id,
    required this.name,
    required this.city,
    required this.description,
    required this.price,
    required this.images,

    required this.location,
    required this.status,
    required this.types,
    required this.app_users_id,
    required this.created_at,
    required this.updated_at,
    required this.app_user
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = Map<String, dynamic>();
    user["id"] = this.id;
    user["name"] = this.name;
    user["description"] = this.description;
    user["price"] = this.price;
    user["city"] = this.city;

    user["images"] = this.images as List;
    user["location"] = this.location;
    user["status"] = this.status;
    user["types"] = this.types;
    user["app_users_id"] = this.app_users_id;
    user["created_at"] = this.created_at;
    user["updated_at"] = this.updated_at;
    user["app_user"] = this.app_user;
    return user;
  }

  factory UserService.fromJson(Map<String, dynamic> parsedJson){
    return UserService(
      id: int.parse(parsedJson['id'].toString()),
      name : parsedJson['name'].toString(),
      city : parsedJson['city'].toString(),
        description: parsedJson['description'].toString(),
      price: int.parse(parsedJson['price'].toString()) ,
      images: json.decode(parsedJson['images']),
      location: json.decode(parsedJson['location']),
      status: parsedJson['status'] as int,
      types: json.decode(parsedJson['types']),
      app_users_id: parsedJson['app_users_id'] as int,
      created_at: parsedJson['created_at'].toString(),
      updated_at: parsedJson['updated_at'].toString(),
      app_user : AppUser.fromJson(parsedJson['app_user'])
    );
  }
}