import 'package:motodomi_app/lib.dart';

class WelcomeRoundedBall extends StatelessWidget {
  const WelcomeRoundedBall({
    super.key,
    required this.color,
    this.height = 300,
  });

  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RoundedBallClipper(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height,
        color: color,
      ),
    );
  }
}

class RoundedBallClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 0, size.width, 150)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(RoundedBallClipper oldClipper) => true;
}
