part of 'imports_widgets_base.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final bool hasLogo;
  final String? title;

  const BaseAppBar({
    Key? key,
    this.title,
    // this.hasLogo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: AppColors.get.transparent,
      title: const AppBarTitle(),
      centerTitle: false,
      actions: [
        GestureDetector(
          onTap: () {
            NavigatorService().to(cartPage);
          },
          child: ImageGeneric.asset(
            url: Assets.homeNotification,
            options: const ImageOptions(),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
