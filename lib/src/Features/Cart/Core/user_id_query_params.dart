import 'package:flutter_base/src/Core/NetworkStructure/Params/params.dart';

class UserIdQueryParams extends Params {
  final int userId;

  UserIdQueryParams({required this.userId});

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
