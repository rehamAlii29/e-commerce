import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/WeekDay/Contoroller/select_week_day_notifier.dart';
import 'package:provider/provider.dart';

import 'list_week_day.dart';

class WeekDayBuilder extends StatelessWidget {
  const WeekDayBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectWeekDayNotifier>(
      builder: (context, _, child) {
        return ListWeekDay(
          selectedIDs: _.selectedDays,
          onSelectDay: _.onSelectWeekDay,
          selectedId: _.selectedDayId,
        );
      },
    );
  }
}
