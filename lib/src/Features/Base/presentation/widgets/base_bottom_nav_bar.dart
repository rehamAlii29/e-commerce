part of 'imports_widgets_base.dart';

class BaseBottomNavBar extends StatelessWidget {
  const BaseBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseCubit, int>(
      builder: (context, state) {
        BaseCubit controller = BaseCubit.get(context);
        return BottomNavigationBar(
          onTap: controller.changeIndex,
          backgroundColor: AppColors.get.main,
          currentIndex: controller.currentIndex,
          items: [
            DefaultBottomNavItem.defaultBottomNavItem(
              label: "",
              image: Assets.home,
            ),
            DefaultBottomNavItem.defaultBottomNavItem(
              label: "",
              image: Assets.heart,
            ),
            DefaultBottomNavItem.defaultBottomNavItem(
              label: "",
              image: Assets.notification,
            ),
            DefaultBottomNavItem.defaultBottomNavItem(
              label: "",
              image: Assets.account,
            ),
          ],
        );
      },
    );
  }
}
