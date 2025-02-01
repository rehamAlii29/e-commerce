part of 'imports_customizable.dart';
/// Confirmed

class ButtonBack extends StatelessWidget {
  final Color? color;

  const ButtonBack({Key? key, this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsetsDirectional.only(
        start: 5.toW(),
      ),
      splashRadius: AppSizes.iconRad.toRad(),
      onPressed: () {
        context.back();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: color,
        size: AppSizes.iconRad.toRad(),
      ),
    );
  }
}
