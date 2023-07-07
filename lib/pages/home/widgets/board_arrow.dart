import 'dart:math';

import 'package:chinese_chess_alpha_zero/bridge_definitions.dart';
import 'package:chinese_chess_alpha_zero/common/global.dart';
import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  List<ChessMove> moves; //画箭头的地方
  Offset leftTopOffSet;
  double pieceGap;

  // 在某固定窗口尺寸下的绘制箭头的常量
  late double _arrowTriangleSize; //箭头三角头部到底部的距离
  late double _arrowWidth1; //偏离主线轴的最大距离，（用于从线发起位置到箭头根部的渐近宽度变化）
  late double _arrowWidth2; //箭头三角底部内测到最外侧的距离

  // 在某固定窗口尺寸下的绘制箭头的常量比率
  final double _arrowTriangleSizeRatio = 25.0 / 54;
  final double _arrowWidth1Ratio = 4.0 / 54;
  final double _arrowWidth2Ratio = 7.0 / 54;
  late double _arrowWidth;

  // 箭头颜色的透明度%，越高越不透明
  final _opacity = 0.9;

  ArrowPainter(this.moves, this.leftTopOffSet, this.pieceGap) {
    _arrowTriangleSize = _arrowTriangleSizeRatio * pieceGap;
    _arrowWidth1 = _arrowWidth1Ratio * pieceGap;
    _arrowWidth2 = _arrowWidth2Ratio * pieceGap;
    _arrowWidth = _arrowWidth1 + _arrowWidth2;
  }
  // 返回2个offset,一个起点，一个终点
  List<Offset> getAbsOffsetFromChessPos(ChessMove move) {
    // src
    final srcDx = leftTopOffSet.dx + pieceGap * (move.srcCol - 1);
    final srcDy = leftTopOffSet.dy + pieceGap * (move.srcRow - 1);
    final srcOffset = Offset(srcDx, srcDy);
    //dst
    final dstDx = leftTopOffSet.dx + pieceGap * (move.dstCol - 1);
    final dstDy = leftTopOffSet.dy + pieceGap * (move.dstRow - 1);
    final dstOffset = Offset(dstDx, dstDy);

    return [srcOffset, dstOffset];
  }

  double getPositiveRad(Offset srcOffset, Offset dstOffset) {
    final rad = (dstOffset - srcOffset).direction;
    return rad < 0 ? 2 * pi + rad : rad;
  }

  double getLength(Offset srcOffset, Offset dstOffset) {
    return (dstOffset - srcOffset).distance;
  }

  final Paint pointPaint =
      Paint() /*  ..style = PaintingStyle.fill */ /* ..strokeWidth = 1 */;

  @override
  void paint(Canvas canvas, Size size) {
    for (var eachMove in moves) {
      canvas.save();
      // 设置颜色
      switch (eachMove.player) {
        case Player.Red:
          pointPaint.color = Colors.red.withOpacity(_opacity);
          break;
        case Player.Black:
          pointPaint.color = Colors.black.withOpacity(_opacity);
          break;
        default:
          throw Exception('Player is not Red or Black, Something went wrong!');
      }
      // 绘制形状的必要参数
      final offsets = getAbsOffsetFromChessPos(eachMove);
      final srcOffset = offsets[0];
      final dstOffset = offsets[1];
      final length = getLength(srcOffset, dstOffset);

      // 设置路径形状
      Path path = Path()
        // 绘制下侧箭头轮廓
        ..relativeLineTo(length - (_arrowTriangleSize / 3 * 2), _arrowWidth1)
        ..relativeLineTo(-_arrowTriangleSize / 3, _arrowWidth2)
        // 绘制箭头终点
        ..lineTo(length, 0) //起点位置和前面所有的relativeLrineTo都没关系
        // 绘制上侧箭头轮廓
        ..relativeLineTo(
            -_arrowTriangleSize, -_arrowWidth) //这里的起点是刚才lineTo的终点坐标
        ..relativeLineTo(_arrowTriangleSize / 3, _arrowWidth2)
        ..close();
      //
      canvas.translate(srcOffset.dx, srcOffset.dy);
      canvas.rotate(getPositiveRad(srcOffset, dstOffset));
      //
      canvas.drawPath(path, pointPaint);
      // canvas.save();

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(ArrowPainter oldDelegate) {
    final isSameLen = moves.length != oldDelegate.moves.length;
    if (isSameLen) {
      for (var i = 0; i < moves.length; i++) {
        if (oldDelegate.moves[i] != moves[i]) return true;
      }
    } else {
      return true;
    }
    return false;
  }
}
