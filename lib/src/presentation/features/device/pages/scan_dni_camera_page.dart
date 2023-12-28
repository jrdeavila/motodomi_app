import 'dart:ui';

import 'package:motodomi_app/lib.dart';

const double _targetWidth = 350;
const double _targetHeight = 250;

class ScanDNICameraPage extends StatefulWidget {
  final String title;
  const ScanDNICameraPage({super.key, required this.title});

  @override
  State<ScanDNICameraPage> createState() => _ScanDNICameraPageState();
}

class _ScanDNICameraPageState extends State<ScanDNICameraPage> {
  final GlobalKey _cameraKey = GlobalKey();
  late CameraController _cameraController;
  bool _isFlashOn = false;
  Uint8List? _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    final cameraDescription = getIt<CameraDescription>();
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.max,
    );
    _cameraController.setFlashMode(FlashMode.off);
    _cameraController.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    }).catchError((error) {
      Get.find<BannerCtrl>().showInfo(
        "Error al iniciar la cámara",
        error.toString(),
      );
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _pickImage() async {
    _loading = true;
    setState(() {});
    final file = await _cameraController.takePicture();
    final bytes = await file.readAsBytes();
    final devicePixelRatio = Get.context!.devicePixelRatio;
    final imageCropped = await cropImageFromMemory(
      bytes,
      _targetWidth.round(),
      _targetHeight.round(),
      devicePixelRatio,
    );
    _image = imageCropped;
    _loading = false;
    setState(() {});
  }

  void _toggleFlash() async {
    _isFlashOn = !_isFlashOn;
    await _cameraController.setFlashMode(
      _isFlashOn ? FlashMode.torch : FlashMode.off,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: (_cameraController.value.previewSize?.height ?? 1) /
            (_cameraController.value.previewSize?.width ?? 1),
        child: Stack(
          children: [
            if (_image == null)
              CameraPreview(
                _cameraController,
                key: _cameraKey,
              ),
            if (_image != null)
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.memory(
                    _image!,
                    width: _targetWidth,
                    height: _targetHeight,
                  ),
                ),
              ),
            if (_image == null)
              ClipPath(
                clipper: DNIClipper(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
            if (_image == null)
              Align(
                alignment: FractionalOffset(
                  0.5,
                  0.5 -
                      (_targetHeight /
                          1.2 /
                          MediaQuery.of(context).size.height),
                ),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: _targetWidth,
                height: _targetHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (_image == null) ...[
              Center(
                child: IconButton(
                  onPressed: _toggleFlash,
                  icon: Icon(
                    _isFlashOn
                        ? FontAwesomeIcons.solidLightbulb
                        : FontAwesomeIcons.lightbulb,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: _loading
                      ? LoadingIndicator(
                          count: 1,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  null,
                ),
              ),
            ],
            if (_image != null) ...[
              IconButton(
                onPressed: () {
                  _image = null;
                  setState(() {});
                },
                icon: Column(
                  children: [
                    const Icon(
                      FontAwesomeIcons.arrowRotateRight,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Volver a tomar",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () async {
                  final bytes = await cropImageFromMemory(
                    _image!,
                    _targetWidth.round(),
                    _targetHeight.round(),
                    Get.context!.devicePixelRatio,
                  );
                  Get.back(result: bytes);
                },
                icon: Column(
                  children: [
                    const Icon(
                      FontAwesomeIcons.check,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Usar esta imagen",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class DNIClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    const cardWidth = _targetWidth;
    const cardHeight = _targetHeight;
    const cardBorderRadius = 5.0;
    var cardHBottom = (h / 2 + cardHeight / 2);
    var cardHTop = (h / 2 - cardHeight / 2);
    var cardWLeft = (w / 2 - cardWidth / 2);
    var cardWRight = (w / 2 + cardWidth / 2);
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(w, 0)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close()
      ..moveTo(cardWLeft, cardHBottom)
      ..lineTo(cardWRight, cardHBottom)
      ..lineTo(cardWRight, cardHTop)
      ..lineTo(cardWLeft, cardHTop)
      ..close()
      ..moveTo(cardWLeft, cardHBottom)
      ..addOval(
        Rect.fromCircle(
          center: Offset(cardWLeft, cardHBottom),
          radius: cardBorderRadius,
        ),
      )
      ..moveTo(cardWRight, cardHBottom)
      ..addOval(
        Rect.fromCircle(
          center: Offset(cardWRight, cardHBottom),
          radius: cardBorderRadius,
        ),
      )
      ..moveTo(cardWRight, cardHTop)
      ..addOval(
        Rect.fromCircle(
          center: Offset(cardWRight, cardHTop),
          radius: cardBorderRadius,
        ),
      )
      ..moveTo(cardWLeft, cardHTop)
      ..addOval(
        Rect.fromCircle(
          center: Offset(cardWLeft, cardHTop),
          radius: cardBorderRadius,
        ),
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
