// lib/radar_widget.dart
import 'dart:math';
import 'package:flutter/material.dart';

/// RadarWidget: 레이더 애니메이션을 보여주는 Widget
class RadarWidget extends StatefulWidget {
  /// 레이더 바탕(동심원) 색상
  final Color radarColor;

  /// 스윕(부채꼴) 색상
  final Color sweepColor;

  /// 아크 크기(도 단위)
  final double sweepSize;

  /// 스윕 속도 (각도 증가량; 1 프레임당 몇 도씩 움직일지)
  final double sweepSpeed;

  const RadarWidget({
    Key? key,
    this.radarColor = const Color(0x90559FFF),
    this.sweepColor = const Color(0x70559FFF),
    this.sweepSize = 70,
    this.sweepSpeed = 2,
  }) : super(key: key);

  @override
  _RadarWidgetState createState() => _RadarWidgetState();
}

class _RadarWidgetState extends State<RadarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;

  @override
  void initState() {
    super.initState();

    // 0도→360도를 반복하는 애니메이션 컨트롤러
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        // 한 바퀴 도는 시간을 sweepSpeed에 맞춰 임의로 정함
        // sweepSpeed가 클수록 짧은 시간에 360도 회전
        milliseconds: (360 / widget.sweepSpeed * 16).round(),
      ),
    );

    // 애니메이션: 0→360 (degree)
    _angleAnimation = Tween<double>(begin: 0, end: 360).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
      // 매 프레임마다 재빌드를 위해 setState()
      setState(() {});
    });

    // 무한 반복
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// getSweepPoint : 3x3 영역 중 현재 스윕 포인트가 속한 셀과 인접 셀 3개 인덱스를 리턴
  /// 인덱스 매핑:
  ///   0 | 1 | 2
  ///  ---+---+---
  ///   3 | 4 | 5
  ///  ---+---+---
  ///   6 | 7 | 8
  ///
  /// 중앙(4)은 제외하고, 해당 영역에 들어온 경우 세 인접 인덱스를 리턴.
  List<int>? getSweepPoint(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final thirdW = width / 3;
    final thirdH = height / 3;
    final radius = min(width, height) / 2;

    // 3x3 영역별 Rect 생성 (가운데만 건너뜀)
    List<Rect?> rects = List.filled(9, null);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (i == 1 && j == 1) continue; // 중앙(4) 제외
        int idx = i * 3 + j;
        rects[idx] = Rect.fromLTWH(
          thirdW * j,
          thirdH * i,
          thirdW,
          thirdH,
        );
      }
    }

    // 현재 스윕 각도 (degree)
    double angleRad = _angleAnimation.value * pi / 180;
    // 애니메이션 포인트 (x, y) 계산 (화면 좌표계: 왼쪽 상단이 (0,0))
    double spx = cos(angleRad) * (radius - 20) + radius;
    double spy = sin(angleRad) * (radius - 20) + radius;

    // 어느 영역 Rect에 포함되는지 판별
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        final idx = i * 3 + j;
        if (i == 1 && j == 1) continue;
        final rect = rects[idx]!;
        if (rect.contains(Offset(spx, spy))) {
          switch (idx) {
            case 0:
              return [0, 1, 2];
            case 1:
              return [1, 2, 5];
            case 2:
              return [2, 5, 8];
            case 3:
              return [3, 0, 1];
            case 5:
              return [5, 8, 7];
            case 6:
              return [6, 3, 0];
            case 7:
              return [7, 6, 3];
            case 8:
              return [8, 7, 6];
          }
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // getSweepPoint 예시 출력 (디버깅 용도)
        List<int>? sweepIndices = getSweepPoint(constraints);

        return Stack(
          alignment: Alignment.center,
          children: [
            // 실제 레이더를 그리는 CustomPaint
            CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: RadarPainter(
                sweepAngle: _angleAnimation.value,
                sweepSize: widget.sweepSize,
                radarColor: widget.radarColor,
                sweepColor: widget.sweepColor,
              ),
            ),

            // (선택) 현재 getSweepPoint() 결과를 화면에 텍스트로 표시
            if (sweepIndices != null)
              Positioned(
                bottom: 16,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    'Indices: ${sweepIndices.join(", ")}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

/// RadarPainter: 실제 캔버스에 레이더와 스윕 아크를 그리는 CustomPainter
class RadarPainter extends CustomPainter {
  final double sweepAngle; // 현재 회전 각도(0~360)
  final double sweepSize;  // 부채꼴(스윕) 각도 크기
  final Color radarColor;  // 동심원 색상
  final Color sweepColor;  // 스윕(부채꼴) 색상

  RadarPainter({
    required this.sweepAngle,
    required this.sweepSize,
    required this.radarColor,
    required this.sweepColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final double radius = min(width, height) / 2;

    // 1) 스윕 아크를 그리기 위해 캔버스 원점(0,0)을 중앙으로 이동
    canvas.save();
    canvas.translate(width / 2, height / 2);

    // 부채꼴(파이) 그리기 (useCenter=true면 삼각형 + 아크 모양으로 채워짐)
    final sweepPaint = Paint()
      ..color = sweepColor
      ..style = PaintingStyle.fill;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(0, 0), radius: radius),
      degToRad(sweepAngle),
      degToRad(sweepSize),
      true,
      sweepPaint,
    );
    canvas.restore();

    // 2) 동심원 그리기 (stroke)
    final circlePaint = Paint()
      ..color = radarColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30;
    drawConcentricCircles(canvas, width / 2, height / 2, radius - 20, 3, circlePaint);
  }

  // 동심원(count 개수만큼) 그리는 함수
  void drawConcentricCircles(Canvas canvas, double cx, double cy, double maxRadius,
      int count, Paint paint) {
    final double step = maxRadius / count;
    for (int i = 1; i <= count; i++) {
      canvas.drawCircle(Offset(cx, cy), step * i, paint);
    }
  }

  @override
  bool shouldRepaint(covariant RadarPainter oldDelegate) {
    // sweepAngle이 바뀔 때마다 다시 그리기
    return oldDelegate.sweepAngle != sweepAngle ||
        oldDelegate.sweepColor != sweepColor ||
        oldDelegate.radarColor != radarColor;
  }

  double degToRad(double degree) => degree * pi / 180;
}