import 'package:flutter_base/src/Core/Services/Audio/local_audio_service.dart';
import 'package:flutter_base/src/Core/Services/GeoLocation/geolocation_services.dart';
import 'package:flutter_base/src/Core/Services/ImageCropper/image_cropper.dart';
import 'package:flutter_base/src/Core/Services/Launcher/launcher_service.dart';
import 'package:flutter_base/src/Core/Services/MapStyle/map_style_service.dart';

/// A place where you have access to all services .
class Helper {
  Helper._();

  static LocalAudioService localAudio = LocalAudioService.instance;

  // static NetworkConnectionService connectivity =
  //     NetworkConnectionService.instance;

  static GeolocationServices location = GeolocationServices.instance;

  static LauncherServices launcher = LauncherServices.instance;

  static MapStyleService mapStyle = MapStyleService.instance;

  static ImageCropperService imageCropper = ImageCropperService.instance;

// static FlutterBluetoothService bluetooth = FlutterBluetoothService.instance;

// static ScreenShotService  screenShot = ScreenShotService.instance;
}
