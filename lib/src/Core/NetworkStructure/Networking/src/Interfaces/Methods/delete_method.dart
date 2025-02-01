abstract class DeleteMethod<R> {
  Future<R?> delete(
      {required String url,
      Map<String, String>? headers,
      Map<String, dynamic>? body,
      bool auth = false,
      bool showLoadingDialog = false});
}
