part of 'imports_data_builder.dart';




class _DataFailedBuilder extends StatelessWidget {
  final ErrorModel? error;
  final VoidCallback? onRedirect;

  const _DataFailedBuilder({
    Key? key,
    required this.error,
    this.onRedirect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorType = error?.type ?? ErrorType.unKnown;
    switch (errorType) {
      case ErrorType.serverSide:
        return IllustrationUnKnownErrorScreen(
          onRedirect: onRedirect,
        );
      case ErrorType.networkConnection:
        return IllustrationNoConnectionScreen(onRedirect: onRedirect);

      case ErrorType.dataEmpty:
        return SimpleErrorHandlerBuilder(error: error);
      case ErrorType.unKnown:
        return IllustrationUnKnownErrorScreen(
          onRedirect: onRedirect,
        );

      case ErrorType.dirtyData:
        return SimpleErrorHandlerBuilder(
          error: error,
        );

      default:
        return IllustrationUnKnownErrorScreen(
          onRedirect: onRedirect,
        );
  }
}}
