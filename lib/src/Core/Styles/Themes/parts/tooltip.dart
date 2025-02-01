part of 'imports_parts.dart';

TooltipThemeData getTooltipTheme() => TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.get.primary.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      enableFeedback: true,
      textStyle: TextStyle(color: AppColors.get.title,),
    );
