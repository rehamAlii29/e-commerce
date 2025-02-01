import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/WeekDay/Data/week_day_model.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/WeekDay/Presentation/cell_week_day.dart';

class ListWeekDay extends StatelessWidget {
  final int selectedId;
  final Function(WeekDayModel) onSelectDay;
  final List<int> selectedIDs;

  const ListWeekDay(
      {super.key,
      required this.selectedId,
      required this.onSelectDay,
      required this.selectedIDs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.toH(),
      child: ListView.separated(
          itemBuilder: (context, index) => CellWeekDay(
                selected:
                    selectedIDs.contains(WeekDayModel.weekDaysList[index].id),
                day: WeekDayModel.weekDaysList[index],
                onSelectDay: () {
                  onSelectDay(WeekDayModel.weekDaysList[index]);
                },
              ),
          separatorBuilder: (context, index) => 16.ESW(),
          scrollDirection: Axis.horizontal,
          itemCount: WeekDayModel.weekDaysList.length),
    );
  }
}
