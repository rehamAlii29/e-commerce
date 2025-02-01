import 'package:equatable/equatable.dart';

class BannerE with EquatableMixin {
  String? id;
  String? image;
  String? link;

  BannerE({
    this.id,
    this.image,
    this.link,

  });

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [id, image,link];
}
