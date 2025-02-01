part of 'imports_suffix.dart';

class SuffixWithIconData extends SuffixImp {
  SuffixWithIconData({
    required IconData iconData,
    Color? color,
    double? size,
    double? scale,
    VoidCallback? onTap,
    double? constraintsHeight,
    double? constraintsWidth,
  }) : super(
            iconData: iconData,
            constraintsHeight: constraintsHeight??TFFConstants.suffixConstrainsHeight,
            constraintsWidth: constraintsWidth??TFFConstants.suffixConstrainsWidth,
            color: color ?? AppColors.get.tTFSuffixIcon,
            size: size?? TFFConstants.suffixIconSize,
            scale: scale??TFFConstants.suffixIconScale,
            onTap: onTap);

  @override
  Widget render(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        iconData,
        color: color,
        size: size?.toW(),
      ),
    );
  }
}
