import '../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../Spaces&Dividers/spaces.dart';
import '../../Text/custom_text_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final Widget? child;
  final String? title;

  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final Color? titleColor;
  final Color? disabledColor;
  final Color? color;
  final VoidCallback? onPressed;
  final double elevation;
  final double? height;
  final double? borderRadius;
  final double? width;
  final double? titleSize;
  final bool isDisabled;
  final EdgeInsetsGeometry? padding;

  final String tooltip;

  const ButtonDefault({
    Key? key,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.disabledColor  ,
    this.color = Colors.white,
    this.onPressed,
    this.elevation = 1.0,
    this.padding,
    this.child,
    this.tooltip = '',
    this.isDisabled = false,
    this.height,
    this.width,
    this.title,
    this.titleColor = Colors.white,
    this.titleSize = 16,
    this.borderRadius,
  }) : super(key: key);

  //
  // Rounded Icon Button -------------------------------------------------------
  factory ButtonDefault.icon({
    /// new
    required final String label,
    required final IconData icon,

    /// super
    final Color? backgroundColor,
    final Color? disabledBackgroundColor ,
    final Color? disabledColor = Colors.white70,
    final Color? color = Colors.white,
    final VoidCallback? onPressed,
    final bool isDisabled = false,
    final bool isUpperCase = false,
    final String tooltip = '',
  }) =>
      ButtonDefault(
        tooltip: tooltip,
        onPressed: onPressed,
        isDisabled: isDisabled,
        color: color,
        disabledColor: disabledColor,
        disabledBackgroundColor: disabledBackgroundColor,
        backgroundColor: backgroundColor ?? AppColors.get.primary,
        child: Builder(builder: (context) {
          Color? color;
          if (isDisabled) {
            color = AppColors.get.disabled;
          } else {
            color = color;
          }
          return _IconRoundedChild(
            color: color,
            label: label,
            icon: icon,
            isUpperCase: isUpperCase,
          );
        }),
      );

  // Rounded Image Button ------------------------------------------------------
  factory ButtonDefault.image({
    /// new
    required final String label,
    required final ImageProvider image,
    final double side = 25,

    /// super
    final Color? backgroundColor,
    final Color? disabledBackgroundColor = Colors.black12,
    final Color? disabledColor = Colors.white70,
    final double? height,
    final Color? color = Colors.white,
    final VoidCallback? onPressed,
    final bool isDisabled = false,
    final bool isUpperCase = false,
    final EdgeInsetsGeometry? padding,
    final String tooltip = '',
  }) =>
      ButtonDefault(
        padding: padding,
        tooltip: tooltip,
        onPressed: onPressed,
        height: height,
        isDisabled: isDisabled,
        color: color,
        disabledColor: disabledColor,
        disabledBackgroundColor: disabledBackgroundColor,
        backgroundColor: backgroundColor ?? AppColors.get.primary,
        child: Builder(builder: (context) {
          Color? color;
          if (isDisabled) {
            color = AppColors.get.disabled;
          } else {
            color = color;
          }
          return _ImageRoundedChild(
            label: label,
            image: image,
            color: color,
            side: side,
            isUpperCase: isUpperCase,
          );
        }),
      );

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // Color? backgroundColor;
        // Color? color;
        // if (isDisabled) {
        //   backgroundColor = disabledBackgroundColor;
        //   color = disabledColor;
        // } else {
        //   backgroundColor = backgroundColor ?? AppColors.get.secondary;
        //   color = color;
        // }
        return IgnorePointer(
          ignoring: isDisabled,
          child: SizedBox(
            width: width ?? double.infinity,
            height: height,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              color: backgroundColor ?? AppColors.get.primary,
              disabledColor: disabledColor ?? AppColors.get.primary.withOpacity(0.5),
              borderRadius: BorderRadius.circular((borderRadius ?? 15).toRad()),
              minSize: height,
              onPressed: isDisabled ? null : onPressed,
              child: tooltip != ''
                  ? Tooltip(
                message: tooltip,
                child: child ??
                    CustomText(
                      "$title",
                      fontSize: titleSize,
                      fontWeight: FW.regular,
                      color: titleColor,
                    ),
              )
                  : child ??
                  CustomText(
                    "$title",
                    fontSize: titleSize,
                    fontWeight: FW.regular,
                    color: titleColor,
                  ),
            ),
          ),
        );
      },
    );
  }
}

class _IconRoundedChild extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;

  final bool isUpperCase;

  const _IconRoundedChild(
      {Key? key,
        required this.label,
        required this.icon,
        this.color,
        required this.isUpperCase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: color),
        Expanded(
          child: Text(
            isUpperCase ? label.toUpperCase() : label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}

class _ImageRoundedChild extends StatelessWidget {
  final String label;
  final ImageProvider image;
  final Color? color;

  final bool isUpperCase;
  final double side;

  const _ImageRoundedChild(
      {Key? key,
        required this.label,
        required this.image,
        this.color,
        required this.isUpperCase,
        required this.side})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: image,
          width: side,
          height: side,
        ),
        XSpace.light,
        CustomText(
          isUpperCase ? label.toUpperCase() : label,
          textAlign: TextAlign.center,
          color: color,
          fontSize: 12,
          fontWeight: FW.medium,
          // fontWeight: FW.MEDIUM,
        ),
      ],
    );
  }
}
