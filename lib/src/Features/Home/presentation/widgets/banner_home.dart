import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageGeneric.network(
      url:
          "https://mir-s3-cdn-cf.behance.net/project_modules/1400/1991b3175172941.64aee4f3b740d.png",
      options: ImageOptions(
          fit: BoxFit.cover,
          height: 160,
          width: double.infinity,
          borderRadius: BorderRadius.circular(10.toRad())),
    );
  }
}
