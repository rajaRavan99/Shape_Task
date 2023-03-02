import 'package:flutter/material.dart';

class PaintDemo extends StatefulWidget {
  const PaintDemo({Key? key}) : super(key: key);

  @override
  _PaintDemoState createState() => _PaintDemoState();
}

class _PaintDemoState extends State<PaintDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Paint"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            painter: PaintingView(),
            child: Center(
                child: Container(
              height: MediaQuery.of(context).size.width / 2,
            )),
          ),
        ],
      ),
    );
  }
}

class PaintingView extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 2.0;
    Path path = Path();
    path.moveTo(0, size.height * 0.7);
    Offset center = const Offset(50.0, 100.0);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
    canvas.drawCircle(center, 40.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
