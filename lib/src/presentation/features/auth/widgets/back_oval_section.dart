import 'package:motodomi_app/lib.dart';

class BackOvalSection extends StatelessWidget {
  const BackOvalSection({
    super.key,
    this.width = 250,
    this.height = 200,
    required this.backLabel,
    required this.labelTitle,
    required this.labelDesc,
  });

  final double width;
  final double height;
  final String backLabel;
  final String labelTitle;
  final String labelDesc;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackOvalIndicatorClipper(),
      child: Container(
        height: height,
        width: width,
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
        padding: const EdgeInsets.only(
          top: kToolbarHeight,
          left: 16,
          right: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBackButton(context),
            const SizedBox(height: 10),
            Text(
              labelTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              labelDesc,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.arrow_back_ios,
            ),
            Text(
              backLabel,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

class BackOvalIndicatorClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - 70, 0)
      ..quadraticBezierTo(
        size.width,
        size.height / 2.7,
        size.width / 1.2,
        size.height - 45,
      )
      ..quadraticBezierTo(
        size.width / 1.35,
        size.height,
        size.width / 2,
        size.height,
      )
      ..quadraticBezierTo(
        size.width / 4,
        size.height,
        0,
        size.height - 50,
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
