part of 'imports_illustrations.dart';

class IllustrationSomethingWrongScreen extends StatelessWidget {
  final VoidCallback? onRedirect;
  final String? body;
  final bool hideAppBar;

  const IllustrationSomethingWrongScreen({
    Key? key,
    this.onRedirect,
    this.hideAppBar = false,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IllustrationPageBuilder(
      // hideAppBar: hideAppBar,
      title: "Something Wrong",
      body: body ?? "illustration_something_went_wrong_details",
      imageUrl: Assets.error,
      showRedirectIcon: false,
      onRedirect: onRedirect ?? () => context.back(),
    );
  }
}
