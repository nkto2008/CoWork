class Service {
  String id;
  String name;
  double price;

  Service(
      this.id,
      this.name,
      this.price,
      );

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      json["_id"],
      json["name"],
      json["price"] as double,
    );
  }
}
