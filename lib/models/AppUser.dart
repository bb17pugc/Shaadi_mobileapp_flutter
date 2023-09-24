class AppUser {
  late int id;
  late String first_name;
  late   final String last_name;
  late final String email;
  late final String phone_number_1;

  late final String image;
  late final String username;
  late final String password;
  late final String phone_number_2;

  late final String address_line;
  late final String user_city;
  late final String country;
  late final int status;
  late final String role;
  late final dynamic category;

  late final String created_at;
  late final String updated_at;
  late final String unsubscribe_at	;



  AppUser({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.phone_number_1,

    required this.image,
    required this.username,
    required this.password,
    required this.phone_number_2,

    required this.address_line,
    required this.user_city,
    required this.country,
    required this.status,
    required this.role,
    required this.category,

    required this.created_at,
    required this.updated_at,
    required this.unsubscribe_at,

  });

  // use when we send data to api as json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = Map<String, dynamic>();
    user["id"] = this.id;
    user["first_name"] = this.first_name;
    user["last_name"] = this.last_name;
    user["email"] = this.email;
    user["phone_number_1"] = this.phone_number_1;

    user["image"] = this.image;
    user["username"] = this.username;
    user["password"] = this.password;
    user["phone_number_2"] = this.phone_number_2;

    user["address_line"] = this.address_line;
    user["user_city"] = this.user_city;
    user["country"] = this.country;
    user["status"] = this.status;
    user["role"] = this.role;
    user["category"] = this.category;
    return user;
  }

  // use when we get from api as json
  factory AppUser.fromJson(Map<String, dynamic> parsedJson){
    return AppUser(
      id: int.parse(parsedJson['id'].toString()),
      first_name : parsedJson['first_name'].toString(),
      last_name: parsedJson['last_name'].toString(),
      email: parsedJson['email'].toString(),
      phone_number_1: parsedJson['phone_number_1'].toString(),
      image: parsedJson['image'].toString(),
      username: parsedJson['username'].toString(),
      password: parsedJson['password'].toString(),
      phone_number_2: parsedJson['phone_number_2'].toString(),
      address_line: parsedJson['address_line'].toString(),
      user_city: parsedJson['user_city'].toString(),
      country: parsedJson['country'].toString(),
      status: int.parse(parsedJson['status'].toString()),
      role: parsedJson['role'].toString(),
      category: parsedJson['category'],
      created_at: parsedJson['created_at'].toString(),
      updated_at: parsedJson['updated_at'].toString(),
      unsubscribe_at: parsedJson['unsubscribe_at'].toString(),

    );
  }
}