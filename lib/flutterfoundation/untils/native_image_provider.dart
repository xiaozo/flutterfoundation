import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../application.dart';

class NativeImageProvider extends ImageProvider<NativeImageProvider> {
  static const MethodChannel _channel =
  const MethodChannel('flutterfoundation');

  final String imageName;
  Uint8List bytes;

   NativeImageProvider(this.imageName);

  @override
  ImageStreamCompleter load(NativeImageProvider key, decode) {
    // TODO: implement load
    return new MultiFrameImageStreamCompleter(
        codec: _loadAsync(key),
        scale: Application.scale,
     );
  }

  Future<ui.Codec> _loadAsync(NativeImageProvider key) async {

    /// 读不到原生图片，开始读取images
    bytes = await _channel.invokeMethod('getNativeImage', {'imageName': imageName});
    if (bytes == null || bytes.lengthInBytes == 0) {
      AssetBundle assetBundle = PlatformAssetBundle();
      ByteData byteData = await assetBundle.load("images/$imageName");
      return await PaintingBinding.instance.instantiateImageCodec(byteData.buffer.asUint8List());
    } else {
      return await _loadAsyncFromFile(key, bytes);
    }
  }

  Future<ui.Codec> _loadAsyncFromFile(NativeImageProvider key, Uint8List bytes) async {
    assert(key == this);
    if (bytes.lengthInBytes == 0) {
      throw new Exception("bytes[] was empty");
    }
    return await ui.instantiateImageCodec(bytes);
  }

  @override
  Future<NativeImageProvider> obtainKey(ImageConfiguration configuration) {
    // TODO: implement obtainKey
    return SynchronousFuture<NativeImageProvider>(this);
  }

}