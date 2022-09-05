import 'model_schedule.dart';

class Place {
  final String name;
  final String city;
  final int cp;
  final String id;

  List<Schedule> schedules = [];

  Place(
    this.name,
    this.city,
    this.cp,
    this.id,
  );
}