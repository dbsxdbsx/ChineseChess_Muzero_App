/*
 * @Author       : 老董
 * @Date         : 2022-04-29 22:27:48
 * @LastEditors  : 老董
 * @LastEditTime : 2022-05-07 16:09:06
 * @Description  : 全局属性
 */
import 'dart:io';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// 一些默认参数
const skinPath = "./assets/skins/";
const boardPath = "./assets/skins/board.svg";
const samplePiecePath = "./assets/skins/bb.svg";
const selected1Path = "./assets/skins/mask.svg";
const selected2Path = "./assets/skins/mask2.svg";

const backgroundStartColor = Color(0xffffd500);
const backgroundEndColor = Color(0xfff6a00c);

const maxSizeScale = 1.5;
const minSizeScale = 0.7;

const testScale = 1.0;
const appWidth = 705.0 * testScale; //用以设置的窗口大小
const appHeight = 545.0 * testScale; //用以设置的窗口大小
var devicePixelRatio = 1.25; //TODO:和windows的缩放比例，暂时先硬编码
var testWidth = 865.0; //基于上述appSize后用spy++实际捕获到的尺寸
var testHeight = 673.0; //基于上述appSize后用spy++实际捕获到的尺寸

// appWidth-->winWidth : appWidth*devicePixelRatio* -16.5
// var winWidth = appWidth * devicePixelRatio * -16.5;
// appHeight-->winHeight : appHeight*devicePixelRatio* - 8.5
const minAppWidth = appWidth * minSizeScale;
const minAppHeight = appHeight * minSizeScale;
const maxAppWidth = appWidth * maxSizeScale;
const maxAppHeight = appHeight * maxSizeScale;
const chessUiWidthRatio = 0.78; //棋盘和状态ui遵行7:3的比例
// const minStateUiWidth = minAppWidth * chessUiWidthRatio;

const aspectRatio = appWidth / appHeight;
var boardWidth = 521.0;
var boardHeight = 577.0;
var testPieceSize = 57.0 * 1.18; //宽高一致

const testBoardLeftTopCornerPos = Offset(460, 199); //捕获时时的窗口左上角全局offset
const testLeftTop1stPos = Offset(498, 235); //捕获时左上角第一点全局offset
const testLeftTop2edPos = Offset(564.47, 235); //捕获时左上角向右第二点全局offset

const stateUiWidth = 250.0; //右侧状态ui的固定宽度
const toobarHeight = 40.0;
const hideToobarHeight = 20.0;

// 常用函数
String getCurrentTimeString() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk:mm:ss').format(now);
  // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  return formattedDate;
}

// getImageSize(String imagePath) async {
//   // board
//   File image = File(imagePath); // Or any other way to get a File instance.
//   var decodedImage1 = await decodeImageFromList(image.readAsBytesSync());
//   return [decodedImage1.width, decodedImage1.height];
//   // // piece
//   // var decodedImage2 =
//   //     await decodeImageFromList(File(boardPath).readAsBytesSync());
//   // _pieceWidth = decodedImage2.width;
//   // _pieceHeight = decodedImage2.height;
// }

// 表示每一步棋的结构体
class ChessMove {
  final int srcRow;
  final int srcCol;
  final int dstRow;
  final int dstCol;
  final Player player;

  ChessMove({
    required this.srcRow,
    required this.srcCol,
    required this.dstRow,
    required this.dstCol,
    required this.player,
  })  : assert(srcRow >= 1 && srcRow <= 10),
        assert(srcCol >= 1 && srcCol <= 9),
        assert(dstRow >= 1 && dstRow <= 10),
        assert(dstCol >= 1 && dstCol <= 9);

  @override
  bool operator ==(Object other) {
    return other is ChessMove &&
        srcRow == other.srcRow &&
        srcCol == other.srcCol &&
        dstRow == other.dstRow &&
        dstCol == other.dstCol;
  }
}

// 被选择的mask类型
enum MaskType {
  none, //未被选中
  focused, //被鼠标点击后mask
  moved, //移动后的mask
}

// chess相关
enum SidePieceType {
  none, //空棋子占位符
  redKing,
  redAdvisor,
  redBishop,
  redKnight,
  redRook,
  redCannon,
  redPawn,

  blackKing,
  blackAdvisor,
  blackBishop,
  blackKnight,
  blackRook,
  blackCannon,
  blackPawn,
}

enum Player { none, red, black }

class Piece {
  SidePieceType _pieceType;
  var _maskType = MaskType.none;
  int row;
  int col;

  Piece(this._pieceType, this.row, this.col);

  SidePieceType pieceType() {
    return _pieceType;
  }

  int pieceIndex() {
    return pieceReverseMap[_pieceType]!;
  }

  MaskType maskType() {
    return _maskType;
  }

  void setMaskType(MaskType maskType) {
    _maskType = maskType;
  }

  void setPiece(SidePieceType piece) {
    _pieceType = piece;
  }

  Player player() {
    switch (_pieceType) {
      case SidePieceType.none:
        return Player.none;
      //
      case SidePieceType.redKing:
        return Player.red;
      case SidePieceType.redAdvisor:
        return Player.red;
      case SidePieceType.redBishop:
        return Player.red;
      case SidePieceType.redKnight:
        return Player.red;
      case SidePieceType.redRook:
        return Player.red;
      case SidePieceType.redCannon:
        return Player.red;
      case SidePieceType.redPawn:
        return Player.red;
      //
      case SidePieceType.blackKing:
        return Player.black;
      case SidePieceType.blackAdvisor:
        return Player.black;
      case SidePieceType.blackBishop:
        return Player.black;
      case SidePieceType.blackKnight:
        return Player.black;
      case SidePieceType.blackRook:
        return Player.black;
      case SidePieceType.blackCannon:
        return Player.black;
      case SidePieceType.blackPawn:
        return Player.black;
    }
  }
}

const pieceMap = {
  0: SidePieceType.none,
  8: SidePieceType.redKing,
  9: SidePieceType.redAdvisor,
  10: SidePieceType.redBishop,
  11: SidePieceType.redKnight,
  12: SidePieceType.redRook,
  13: SidePieceType.redCannon,
  14: SidePieceType.redPawn,
  16: SidePieceType.blackKing,
  17: SidePieceType.blackAdvisor,
  18: SidePieceType.blackBishop,
  19: SidePieceType.blackKnight,
  20: SidePieceType.blackRook,
  21: SidePieceType.blackCannon,
  22: SidePieceType.blackPawn,
};

const pieceReverseMap = {
  SidePieceType.none: 0,
  SidePieceType.redKing: 8,
  SidePieceType.redAdvisor: 9,
  SidePieceType.redBishop: 10,
  SidePieceType.redKnight: 11,
  SidePieceType.redRook: 12,
  SidePieceType.redCannon: 13,
  SidePieceType.redPawn: 14,
  SidePieceType.blackKing: 16,
  SidePieceType.blackAdvisor: 17,
  SidePieceType.blackBishop: 18,
  SidePieceType.blackKnight: 19,
  SidePieceType.blackRook: 20,
  SidePieceType.blackCannon: 21,
  SidePieceType.blackPawn: 22,
};

const newChessGameLog = "新建棋局";

const boardRowCount = 10;
const boardColCount = 9;
