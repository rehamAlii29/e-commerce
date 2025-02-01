import 'package:audioplayers/audioplayers.dart';

  class LocalAudioService {
    LocalAudioService._();
   static LocalAudioService instance = LocalAudioService._();
    // ----------------------------------------------------------
    final AudioCache _player = AudioCache();
    Future<Uri> play(String asset, {bool isMp3 = false}) {
    return _player.load(asset);
  }

}

