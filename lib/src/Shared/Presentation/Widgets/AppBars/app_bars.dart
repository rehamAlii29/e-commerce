import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:get/get.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';



class AppBars extends StatelessWidget implements PreferredSizeWidget {
  final AppBar _appBar;
  final double? toolbarHeight;
  final double? bottomHeight;

  const AppBars._(
      this._appBar, {
        Key? key,
        this.toolbarHeight,
        this.bottomHeight,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _appBar;
  }

  @override
  Size get preferredSize => Size.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  // factory AppBars.home(BuildContext context) {
  //   final SearchPlaceController _searchPlaceController =
  //   Get.put(SearchPlaceController());
  //   final userAddress = UserLocation().getLocationAddress;
  //   final locationController = Get.find<LocationController>();
  //   return AppBars._(
  //     AppBar(
  //       // toolbarHeight: 170.toH(),
  //       backgroundColor: Colors.transparent,
  //       automaticallyImplyLeading: false,
  //       flexibleSpace: GetBuilder<SearchPlaceController>(
  //         init: _searchPlaceController,
  //         builder: (_) {
  //           return Container(
  //             padding: EdgeInsets.symmetric(horizontal: 16.toW()),
  //             decoration: BoxDecoration(
  //               color:
  //               AppController.isDark ? AppColors.get.activeBackground : null,
  //               gradient: AppController.isDark
  //                   ? null
  //                   : const LinearGradient(
  //                   begin: Alignment.topCenter,
  //                   end: Alignment.bottomCenter,
  //                   colors: <Color>[
  //                     Color(0xffE4F2FF),
  //                     Colors.white,
  //                   ]),
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 10.ESH(),
  //                 Row(
  //                   children: [
  //                     IconButton(
  //                       iconSize: 20.toRad(),
  //                       splashRadius: 30.toRad(),
  //                       splashColor: AppColors.get.main,
  //                       onPressed: () {
  //                         locationController.getLocation();
  //                       },
  //                       icon: Icon(
  //                         Icons.compass_calibration_outlined,
  //                         color: AppColors.get.primary,
  //                       ),
  //                     ),
  //                     if (userAddress != "") ...[
  //                       Row(
  //                         children: [
  //                           ImageIcon(
  //                             AssetImage("location_marker".toIcon),
  //                             size: 12.toRad(),
  //                             color: AppColors.get.title,
  //                           ),
  //                           5.2.ESW(),
  //                           CustomText(
  //                             userAddress,
  //                             fontSize: 13,
  //                             fontWeight: FW.regular,
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                     const Spacer(),
  //                     // const NotificationButton(),
  //                     const NotificationBadge(),
  //                   ],
  //                 ),
  //                 10.ESH(),
  //                 CustomText.header(
  //                   "where_do_you_want_to_go",
  //                 ),
  //                 13.ESH(),
  //                 Hero(
  //                   tag: "${_.searchController}",
  //                   child: AdaptiveSearchBar(
  //                     controller: _.searchController,
  //                     height: 48.toH(),
  //                     hintLabel: "search_by_places",
  //                     onChanged: (value) {
  //                       if (value.length > 2) {
  //                         context.to(const SearchPlaceScreen());
  //                         _.onSearch();
  //                       }
  //                     },
  //                     onSubmitted: (value) {
  //                       context.to(const SearchPlaceScreen());
  //                       _.onSearch();
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //       actions: [
  //         // IconButton(
  //         //   icon:Image.asset("".toImg),
  //         //   onPressed: () {
  //         //
  //         //   },
  //         // ),
  //       ],
  //     ),
  //     toolbarHeight: (230.toH()),
  //   );
  // }

  // factory AppBars.logo({
  //   double? toolbarHeight,
  // }) {
  //   return AppBars._(
  //     AppBar(
  //       title: AppLogo.defaultLogo(
  //         height: 34.toH(),
  //         width: 60.toW(),
  //       ),
  //       automaticallyImplyLeading: false,
  //       toolbarHeight: (toolbarHeight ?? kToolbarHeight).toH(),
  //     ),
  //     toolbarHeight: (toolbarHeight ?? kToolbarHeight).toH(),
  //   );
  // }

  factory AppBars.basic({
    String? title,
    List<Widget>? actions,
    double? toolbarHeight,
    Widget? titleWidget,
    bool? centerTitle,
    Color? titleColor,
    bool isTitleBold = false,
    bool isBack = true,
    Widget? leading,
  }) {
    return AppBars._(
      AppBar(
        title: titleWidget ??
            CustomText(
              title ?? "",
              isBold: isTitleBold,
              color: titleColor ?? AppColors.get.black,
              fontSize: 14,
              fontWeight: FW.semiBold,
            ),
        actions: actions,
        centerTitle: centerTitle??true,
        shadowColor: AppColors.get.shadow,
        elevation: 0,
        backgroundColor:  AppColors.get.background,
        leading: isBack
            ? IconButton(
          onPressed: ()=> Get.back(),
          splashRadius: 20.toRad(),
          icon: Icon(
            Icons.arrow_back_outlined,
            size: 24.toRad(),
          ),
          color: AppColors.get.opposite,
        )
            : leading ?? 0.ESH(),
      ),
      toolbarHeight: (toolbarHeight ?? kToolbarHeight).toH(),
    );
  }


  factory AppBars.colored({
    String? title,
    List<Widget>? actions,
    double? toolbarHeight,
    Widget? titleWidget,
    bool? centerTitle,
    Color? titleColor,
    bool isTitleBold = false,
    bool isBack = true,
    Widget? leading,
  }) {
    return AppBars._(
      AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.get.secondaryColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: titleWidget ??
            CustomText(
              title ?? "",
              isBold: isTitleBold,
              color: titleColor ?? AppColors.get.black,
              fontSize: 14,
              fontWeight: FW.semiBold,
            ),
        actions: actions,
        centerTitle: centerTitle??true,
        shadowColor: AppColors.get.shadow,
        elevation: 0,
        backgroundColor:  AppColors.get.secondaryColor,
        leading: isBack
            ? IconButton(
          onPressed: () => Get.back(),
          splashRadius: 20.toRad(),
          icon: Icon(
            Icons.arrow_back_outlined,
            size: 24.toRad(),
          ),
          color: AppColors.get.opposite,
        )
            : leading ?? 0.ESH(),
      ),
      toolbarHeight: (toolbarHeight ?? kToolbarHeight).toH(),
    );
  }

}
