import 'model_servforsub.dart';

class Subscribe {
  String name;
  double price;
  String id;

  List<ServiceSub> services = [];

  Subscribe(
      this.name,
      this.price,
      this.id,
      );
}