class WeekDayModel {
  final int id;
  final String name;
  final String brief;

  WeekDayModel({
    required this.id,
    required this.name,
    required this.brief,
  });

  static List<WeekDayModel> weekDaysList = [
    WeekDayModel(id: 1, name: 'Monday', brief: 'M'),
    WeekDayModel(id: 2, name: 'Tuesday', brief: 'T'),
    WeekDayModel(id: 3, name: 'Wednesday', brief: 'W'),
    WeekDayModel(id: 4, name: 'Thursday', brief: 'TH'),
    WeekDayModel(id: 5, name: 'Friday', brief: 'F'),
    WeekDayModel(id: 6, name: 'Saturday', brief: 'S'),
    WeekDayModel(id: 7, name: 'Sunday', brief: 'Su'),
  ];
}
