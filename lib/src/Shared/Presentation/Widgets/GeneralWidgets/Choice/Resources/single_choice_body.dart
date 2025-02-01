import 'package:flutter/material.dart';

import '../../../../../../Core/utils/Extensions/screen_spaces_extension.dart';
import '../../../../../Entities/title_interface.dart';
import '../Components/choice_single_row.dart';

class SingleChoiceBody<T extends TitleInterface> extends StatelessWidget {
  final int selectedId;
  final Function(T) onSave;
  final List<T> items;

  const SingleChoiceBody({
    required this.selectedId,
    required this.onSave,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.toW()),
          child: ChoiceSingleRow<T>(
            active: selectedId == items[index].id,
            item: items[index],
            onTap: () {
              onSave(items[index]);
            },
          )),
      separatorBuilder: (context, index) => 8.ESH(),
      itemCount: items.length,
    );
  }
}
