  part of 'imports_illustrations.dart';


class IllustrationNoNotificationsScreen extends StatelessWidget {

  final VoidCallback? onRedirect;

  const IllustrationNoNotificationsScreen({Key? key, this.onRedirect,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IllustrationPageBuilder(
      title: "illustration_no_notifications",
      body: "illustration_no_notifications_details",
      imageUrl: Assets.noNotifications,
      showRedirectIcon: false,
      onRedirect: onRedirect??  () {
        context.back();
      },

    );
  }
}
