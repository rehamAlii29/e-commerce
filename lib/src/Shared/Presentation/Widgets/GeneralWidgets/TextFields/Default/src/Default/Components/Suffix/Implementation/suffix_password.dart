part of 'imports_suffix.dart';

class SuffixPassword extends SuffixImp {
  final bool isPasswordVisible;

  SuffixPassword({
    double? constraintsHeight,
    double? constraintsWidth,
    Color? color,
    VoidCallback? onTap,
    this.isPasswordVisible = false,
    double? size,
  }) : super(
          constraintsHeight:
              constraintsHeight ?? TFFConstants.suffixConstrainsHeight,
          constraintsWidth:
              constraintsWidth ?? TFFConstants.suffixConstrainsWidth,
          color: color ?? AppColors.get.tTFSuffixIcon,
          onTap: onTap,
          size: size ?? TFFConstants.suffixIconSize,
        );

  @override
  Widget render(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.toW()) + EdgeInsets.zero,
        child: Icon(
          isPasswordVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: color,
          size: size?.toRad(),
        ),
      ),
    );
  }
}
