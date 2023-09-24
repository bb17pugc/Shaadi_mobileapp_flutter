

class Product {
  late final int id,price,packing_unit;
  late final String name, unit ,in_stock,expires_at,image;
  late final double discount;
  late final dynamic category;

  Product({required this.id, required this.name,required this.category, required this.price, required this.unit, required this.packing_unit, required this.in_stock, required this.discount, required this.expires_at,required this.image});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> product = Map<String, dynamic>();
    product["id"] = this.id;
    product["name"] = this.name;
    product["price"] = this.price;
    product["unit"] = this.unit;
    product["packing_unit"] = this.packing_unit;
    product["in_stock"] = this.in_stock;
    product["discount"] = this.discount;
    product["expires_at"] = this.expires_at;
    product["image"] = this.image;
    product["category"] = this.category;


    return product;
  }

  factory Product.fromJson(Map<dynamic, dynamic> parsedJson){

    return Product(
      id: int.parse(parsedJson['id'].toString()),
      name : parsedJson['name'].toString(),
      price: parsedJson['price'],
      unit:parsedJson['unit'].toString(),
      packing_unit: parsedJson['packing_unit'],
      in_stock: parsedJson['in_stock'].toString(),
      discount: parsedJson['discount'],
      expires_at: parsedJson['expires_at'],
      image: parsedJson['image'],
      category: parsedJson['category'],

    );
  }
}