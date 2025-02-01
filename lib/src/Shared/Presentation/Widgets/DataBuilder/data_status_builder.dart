part of 'imports_data_builder.dart';

class DataStatusBuilder extends StatelessWidget {
  final DataState status;
  final Widget? initialBuild;
  final Widget onDoneBuild;
  final Widget? onConnectionErrorBuild;
  final Widget? onErrorBuild;
  final Widget? onLoadingBuild;
  final VoidCallback? onRedirect;
  final bool  isOnRefreshed;
  const DataStatusBuilder({
    Key? key,
    required this.status,
    required this.onDoneBuild,
    this.onConnectionErrorBuild,
    this.initialBuild,
    this.onErrorBuild,
    this.onLoadingBuild,
    this.onRedirect, this.isOnRefreshed= false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget? widget = const SizedBox.shrink();
    if (status is DataInitial) {
      widget = initialBuild ?? const SizedBox.shrink();
      // widget = Center();
    } else if (status is DataLoading) {
      widget = onLoadingBuild ??  ( isOnRefreshed?const SizedBox.shrink():AppLoader());
      // widget = AppLoader();
    } else if (status is DataSuccess) {
      widget = onDoneBuild;
      // widget = Center();
    } else if (status is DataFailed) {
      widget = onErrorBuild??_DataFailedBuilder(error: status.error,onRedirect: onRedirect,);
      // widget = Center();
    } else {
      widget = onLoadingBuild ?? ( isOnRefreshed?const SizedBox.shrink():AppLoader());
      // widget = Center();
    }
    return widget;
  }
}

