import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:motodomi_app/lib.dart';

// Download image from network
Future<Uint8List> imageFromNetworkImage(String? imageUrl) async {
  if (imageUrl == null) {
    throw Exception('Failed to load image');
  }
  var response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load image');
  }
}

// Crop Image from Memory
Future<Uint8List> cropImageFromMemory(
  Uint8List image,
  int width,
  int height,
  double devicePixelRatio,
) async {
  final inputImage = img.decodeImage(image);
  if (inputImage == null) {
    throw Exception('Failed to load image');
  }

  final widthCrop = width * devicePixelRatio;
  final heightCrop = height * devicePixelRatio;

  final cropImage = img.copyCrop(
    inputImage,
    x: ((inputImage.width - widthCrop) / 2).round(),
    y: ((inputImage.height - heightCrop) / 2).round(),
    width: widthCrop.round(),
    height: heightCrop.round(),
  );

  final resizedImage = img.copyResize(
    cropImage,
    width: width,
    height: height,
  );

  return img.encodeJpg(resizedImage);
}
