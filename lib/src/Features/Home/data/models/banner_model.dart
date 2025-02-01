
import 'package:flutter_base/src/Core/Utils/general_utils.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/banner.dart';

class BannerModel extends BannerE {
  BannerModel({
    String? id,
    String? image,
    String? link,
  }) : super(
          id: id,
          image: image,
          link: link,
        );

  BannerModel.fromJson(Map<String, dynamic> json) {
    printDM("******************* BannerModel *******************");
    id = (json['id'] ?? "0").toString();
    printDM("Banner id:=> $id");
    image = json['image'] ?? "";
    printDM("Banner image:=> $image");
    link = json['link'] ?? "";
    printDM("Banner link:=> $link");
    printDM("*************************************************");
  }
}
