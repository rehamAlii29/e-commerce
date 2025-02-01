import 'package:equatable/equatable.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/parser_extension.dart';


class User extends Equatable {
  final int id;
  final String name;
  final String phone;
  final String parentName;
  final String parentPhone;
  final String profileImage;
  final String apiToken;
  final bool requirePhoneVerification;
  final bool isPhoneVerified;
//<editor-fold desc="Data Methods">

  const User({
    required this.id,
    required this.name,
    required this.phone,
    required this.parentName,
    required this.parentPhone,
    required this.apiToken,
    required this.requirePhoneVerification,
    required this.isPhoneVerified,
     required this.profileImage,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'parent_name': parentName,
      'parent_phone': parentPhone,
      'profile_image': profileImage,
      'api_token': apiToken,
      'require_phone_verification': requirePhoneVerification,
      'is_phone_verified': isPhoneVerified,

    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json.parse<int>('id'),
      name: json.parse<String>('name'),
      phone: json.parse<String>('phone'),
      profileImage: json.parse<String>('profile_image'),
      parentName: json.parse<String>('parent_name'),
      parentPhone: json.parse<String>('parent_phone'),
      apiToken: json.parse<String>('api_token'),
      requirePhoneVerification: json.parse<bool>('require_phone_verification'),
      isPhoneVerified: json.parse<bool>('is_phone_verified'),
    );
  }




  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        phone,
        parentName,
        parentPhone,
        profileImage,
        apiToken,
        requirePhoneVerification,
         isPhoneVerified,

      ];

  User copyWith({
    int? id,
    String? name,
    String? phone,
    String? parentName,
    String? parentPhone,
    String? profileImage,
    String? apiToken,
    bool? requirePhoneVerification,
    bool? isPhoneVerified,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      parentName: parentName ?? this.parentName,
      parentPhone: parentPhone ?? this.parentPhone,
      profileImage: profileImage ?? this.profileImage,
      apiToken: apiToken ?? this.apiToken,
      requirePhoneVerification: requirePhoneVerification ?? this.requirePhoneVerification,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
    );
  }
  static User example = const User(
    id: 1,
    name: "Ahmed",
    phone: "01000000000",
    parentName: "Mohamed",
    apiToken: "token",
    parentPhone: "01000000000",
    requirePhoneVerification: false,
    isPhoneVerified: true,
    profileImage: "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
  );

}
