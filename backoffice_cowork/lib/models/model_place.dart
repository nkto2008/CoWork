import 'model_schedule.dart';

class Place {
  String name;
  String city;
  int cp;
  String id;

  List<Schedule> schedules = [];

  Place(
    this.name,
    this.city,
    this.cp,
    this.id,
  );
}
