part of 'imports_widgets_tff.dart';

class TFFHeaderBuilder extends StatelessWidget {
  final TFFTextImp header;
  final bool required;

  const TFFHeaderBuilder(
      {Key? key, required this.header, this.required = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: header is TFFHeader,
      onBuild: Padding(
        padding: EdgeInsets.only(bottom: 7.toH()),
        child: Container(
          color: AppColors.get.white,
          child: Row(
            children: [
              Text(header.title.noneNull.toTr(),
                  overflow: TextOverflow.ellipsis, style: header.getTextStyle),
              if (required)
                Text(
                  "*",
                  style: TextStyle(color: AppColors.get.primary),
                )
            ],
          ),
        ),
      ),
      onFeedBack: 0.ESH(),
    );
  }
}
