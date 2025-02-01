import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/WeekDay/Data/week_day_model.dart';

class SelectWeekDayNotifier extends ChangeNotifier {
  int selectedDayId = -1;
  List<int> selectedDays = [];

  onSelectWeekDay(WeekDayModel day) {
    selectedDayId = day.id;
    if (selectedDays.contains(selectedDayId)) {
      selectedDays.remove(day.id);
    } else {
      selectedDays.add(day.id);
    }
    notifyListeners();
  }
}
