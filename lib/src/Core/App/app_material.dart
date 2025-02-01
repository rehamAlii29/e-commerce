import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Constants/strings/app_strings.dart';
import 'package:flutter_base/src/Core/Libraries/snap/src/snap_main.dart';
import 'package:flutter_base/src/Core/Libraries/snap/src/snap_router/route_generator.dart';
import 'package:flutter_base/src/Core/Services/NavigatorService/on_generate_rout_implementation.dart';
import 'package:flutter_base/src/Core/Styles/Themes/imports_themes.dart';
import 'package:flutter_base/src/Core/Utils/utils.dart';

import '../Services/NavigatorService/navigator_service.dart';

class AppMaterial extends StatelessWidget {
  final Widget home;

  const AppMaterial({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigatorService().navigatorKey,
      onGenerateRoute: OnGenerateRoutImplementation().onGenerateRout,
      locale: Utils.cachedLocale,
      title: AppStrings.appName,
      theme: ThemeManager.light,
      home: home,
    );
  }
}
