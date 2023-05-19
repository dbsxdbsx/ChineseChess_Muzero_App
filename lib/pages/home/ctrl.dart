/*
 * @Author       : 老董
 * @Date         : 2022-04-29 10:49:11
 * @LastEditors  : 老董
 * @LastEditTime : 2022-12-07 17:10:37
 * @Description  : 用以控制HomeView的control组件
 */

import 'dart:async';

import 'package:chinese_chess_alpha_zero/gened_ucci_api.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pausable_timer/pausable_timer.dart';
import '../../common/global.dart';
import '../../common/widgets/toast/toast_message.dart';
import '../../ffi.dart';

enum TimerControlType {
  start,
  stop,
  pause,
}

class DigitTimeController {
  final _duration = Duration.zero.obs;

  get duration => _duration;
  get inSeconds => _duration.value.inSeconds;
  get inMinutes => _duration.value.inMinutes;
  get inHours => _duration.value.inHours;

  late final PausableTimer _timer;
  int _elapsedMSecs = 0;

  _setTimeElapsed(mSeconds) {
    _duration.value = Duration(milliseconds: mSeconds);
  }

  runTimer() {
    if (!_timer.isActive) {
      _timer.start();
    }
  }

  stopTimer() {
    if (_timer.isActive || _timer.isPaused) {
      _timer.pause();
      _timer.reset();
      _elapsedMSecs = 0;
      _setTimeElapsed(_elapsedMSecs); //更新ui显示
    }
  }

  pauseTimer() {
    if (_timer.isActive) {
      _timer.pause();
    }
  }

  DigitTimeController() {
    // Timer
    _timer = PausableTimer(
      const Duration(milliseconds: 1000),
      () {
        _elapsedMSecs += 1000;
        _setTimeElapsed(_elapsedMSecs);
        // debugPrint("time 111");
        _timer
          ..reset()
          ..start();
      },
    );
  }
}

class HomeController extends GetxController {
  final _dockActivate = false.obs;

  final enginePaths = <String>[]; //尚未添加任何引擎路径前，就为空list

  bool humanCanMove = true;

  final enginePathMap = <String, String>{}; //key:引擎名字 value:引擎路径

  final _isRedEngineLoaded = false.obs;
  get isRedEngineLoaded => _isRedEngineLoaded.value;
  set isRedEngineLoaded(value) => _isRedEngineLoaded.value = value;
  final _isBlackEngineLoaded = false.obs;
  get isBlackEngineLoaded => _isBlackEngineLoaded.value;
  set isBlackEngineLoaded(value) => _isBlackEngineLoaded.value = value;
  //↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓PlayerDigitalClock状态控制器↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
  final _redTimeController = DigitTimeController().obs;
  get redTimeController => _redTimeController; //故意不写value
  set redTimeController(value) => _redTimeController.value = value;

  final _blackTimeController = DigitTimeController().obs;
  get blackTimeController => _blackTimeController; //故意不写value
  set blackTimeController(value) => _blackTimeController.value = value;
  //↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑PlayerDigitalClock状态控制器↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

  //↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓引擎名字↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
  final _redEngineName = "".obs;
  get redEngineName => _redEngineName.value;
  set redEngineName(value) => _redEngineName.value = value;

  final _blackEngineName = "".obs;
  get blackEngineName => _blackEngineName.value;
  set blackEngineName(value) => _blackEngineName.value = value;
  //↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑引擎名字↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

  //↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ucci engine stream↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
  // http://cjycode.com/flutter_rust_bridge/feature/stream.html
  final _engineCallback = "".obs;
  late final Worker _engineStreamWorker;
  //↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ucci engine stream↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

  //↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓红黑方是否被电脑托管↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
  final _isRedHosted = false.obs;
  get isRedHosted => _isRedHosted;
  set isRedHosted(value) => _isRedHosted.value = value;

  final _isBlackHosted = false.obs;
  get isBlackHosted => _isBlackHosted;
  set isBlackHosted(value) => _isBlackHosted.value = value;
  //↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑红黑方是否被电脑托管↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

  get dockActivate => _dockActivate.value;
  set dockActivate(value) => _dockActivate.value = value;

  HomeController() {
    for (var i = 0; i < boardRowCount * boardColCount; i++) {
      pieces.add(Piece(SidePieceType.none, i));
    }

    _engineStreamWorker = ever(
      _engineCallback,
      (receivedValue) {
        onReceiveUcciEngineMessage(receivedValue);
      },
    );
  }

  void onReceiveUcciEngineMessage(Object? value) {
    // final engineFeedback = value.toString();
    // final engineFeedbackLow = engineFeedback.toLowerCase();
    // if (engineFeedbackLow == "hookok") {
    //   // if (engineFeedbackLow == "ucciok" || engineFeedback == "uciok") {
    //   _isFeedbackCorrect = true;
    // }
    addLog(value.toString());
  }

  var gameStarted = false;
  final _logs = <DataRow>[].obs;

  final masks = <Piece>[]; //添加了mask的piece引用列表

  get logs => _logs;
  set logs(value) => _logs.value = value;

  //该list中是当前需要被展示的所有棋子信息
  final pieces = <Piece>[];

  // 需要绘制箭头的棋步
  final arrowMoves = <ChessMove>[];

  // set pieces(value) => _pieces.value = value;
  Piece? _focusedPieceRef; //被鼠标选中的棋子,指向_pieces中某piece元素的引用

  //
  Player? _player;
  //
  final _animatedContainerHeight = toobarHeight.obs;
  get animatedContainerHeight => _animatedContainerHeight.value;
  set animatedContainerHeight(value) => _animatedContainerHeight.value = value;

  // 棋子相关的尺寸
  var leftTopOffSet = const Offset(0.0, 0.0); //左上角棋子位置距离棋盘左上角的offset
  var pieceGap = 0.0; //相邻2个棋子中心位置的间距，x、y轴都一样
  var pieceSize = 0.0; //这个是调整过的棋子尺寸，宽高一致

  //这个是调整过的浮动工具栏宽度
  final _panelWidth = 0.0.obs;
  get panelWidth => _panelWidth.value;
  set panelWidth(value) => _panelWidth.value = value;

  //这个是调整过的浮动工具栏的圆角半径
  final _borderRadius = 0.0.obs;
  get borderRadius => _borderRadius.value;
  set borderRadius(value) => _borderRadius.value = value;

  Future<void> onToolButtonPressed(String logContent) async {
    addLog(logContent);
    final indexes = <int>[];

    switch (logContent) {
      case newGameBtnLog:
        var correctRow = 0;
        var correctCol = 0;
        final origBoardArray = await ruleApi.getOrigBoard();
        for (int i = 0; i < origBoardArray.length; i++) {
          final origRow = (i + 1) ~/ 16;
          final modNum = (i + 1) % 16;
          if (modNum == 0) {
            correctRow = origRow - 3;
            correctCol = 16 - 3;
          } else {
            correctRow = origRow + 1 - 3;
            correctCol = modNum - 3;
          }
          final inBoardRowRange =
              correctRow >= 1 && correctRow <= boardRowCount;
          final inBoardColRange =
              correctCol >= 1 && correctCol <= boardColCount;
          if (inBoardRowRange && inBoardColRange) {
            final pieceTypeNum = origBoardArray[i];
            var pieceType = pieceMap[pieceTypeNum];
            if (pieceType != null) {
              final index = (correctRow - 1) * boardColCount + correctCol - 1;
              pieces[index].setPieceType(pieceType);
              pieces[index].setMaskType(MaskType.none);

              indexes.add(index);
            }
          }
        }
        // 后台数据更新
        _player = Player.Red;
        await _updateBackData();

        // 呼叫棋子ui更新
        update(indexes);

        //初始化棋子ui相关内存变量
        _focusedPieceRef = null;
        masks.clear();
        arrowMoves.clear();

        // 设置游戏开始
        gameStarted = true;

        // 呼叫计时，之后用户将能看到计时动画
        _initialTimer();

        break;
      case newAIBtnLog:
        // _redTimeController.value.runTimer();
        break;
      // setting窗口因为需要context, 所以不要在这里构建
      // case newSettingBtnLog:
      //   // getSettingSheet(context);
      //   break;
      default: //测试用
    }
  }

  void _initialTimer() {
    _redTimeController.value.stopTimer();
    _blackTimeController.value.stopTimer();

    _redTimeController.value.stopTimer();
    _blackTimeController.value.stopTimer();

    _redTimeController.value.runTimer();
  }

  void _switchPlayerAndTimer() {
    switch (_player!) {
      case Player.Red:
        _redTimeController.value.pauseTimer();
        _blackTimeController.value.runTimer();
        _player = Player.Black;
        break;
      case Player.Black:
        _blackTimeController.value.pauseTimer();
        _redTimeController.value.runTimer();
        _player = Player.Red;
        break;
    }
  }

  void addLog(String logContent) {
    _logs.insert(
      0,
      DataRow(
        cells: [
          DataCell(Text(getCurrentTimeString())),
          DataCell(Text(logContent)),
        ],
      ),
    );
  }

  // 整个窗口任意位置点击均会触发此函数
  Future<void> onWindowClicked(Offset localPosition) async {
    // 是否为有效点击位
    final validClickedPieceRef = getChessPosFromOffset(localPosition);
    if (validClickedPieceRef == null) {
      //NOTE：为null仅代表该位置非有效点击坐标，不包括该位置为空棋子的情况
      return;
    }
    addLog("有效点击：行${validClickedPieceRef.row}列${validClickedPieceRef.col}");

    if (_focusedPieceRef != null) {
      // ASSERT
      if (_player != _focusedPieceRef!.player()) {
        throw '当前玩家和被选中的棋子的不是同一玩家';
      }
      //
      if (validClickedPieceRef.player() == _player) {
        _focusedPieceRef!.setMaskType(MaskType.none);
        validClickedPieceRef.setMaskType(MaskType.focused);
        update([_focusedPieceRef!.index, validClickedPieceRef.index]);
        _focusedPieceRef = validClickedPieceRef;
      } else if (await isMoveOrEatable(
          _focusedPieceRef!, validClickedPieceRef)) {
        // 移动棋子
        validClickedPieceRef.setPieceType(_focusedPieceRef!.pieceType());
        _focusedPieceRef!.setPieceType(SidePieceType.none);

        // 将之前masked的边框全部清除掉
        final oldMaskId = [];
        for (var eachMaskedPiece in masks) {
          eachMaskedPiece.setMaskType(MaskType.none);
          oldMaskId.add(eachMaskedPiece.index);
        }

        // 设置新移动棋子的mask并加入masks
        _focusedPieceRef!.setMaskType(MaskType.moved);
        validClickedPieceRef.setMaskType(MaskType.moved);
        masks.clear();
        masks.add(_focusedPieceRef!);
        masks.add(validClickedPieceRef);

        // 必要更新（注意顺序）
        update([
          ...oldMaskId,
          _focusedPieceRef!.index,
          validClickedPieceRef.index,
        ]);
        _switchPlayerAndTimer();

        await _updateBackData(); //更新后台数据
        _focusedPieceRef = null;
      }
    } else if (validClickedPieceRef.player() == _player) {
      validClickedPieceRef.setMaskType(MaskType.focused);
      _focusedPieceRef = validClickedPieceRef;
      update([_focusedPieceRef!.index]);
    }
  }

  _updateBackData() async {
    await _updateBoardData();
    await _updatePlayerData();
  }

  _updateBoardData() async {
    for (var piece in pieces) {
      await ruleApi.updateBoardData(
          row: piece.row, col: piece.col, pieceIndex: piece.pieceIndex());
    }
  }

  _updatePlayerData() async {
    switch (_player!) {
      case Player.Red:
        await ruleApi.updatePlayerData(player: 'r');
        break;
      case Player.Black:
        await ruleApi.updatePlayerData(player: 'b');
        break;
    }
  }

  Future<bool> isMoveOrEatable(Piece srcPiece, Piece dstPiece) async {
    if ((srcPiece.player()!) != _player!) {
      throw '错误：带检查的起始位置棋子非当前玩家';
    }
    final distPiecePlayer = dstPiece.player();
    if (distPiecePlayer != null && distPiecePlayer == _player!) {
      throw '错误：带检查的目标位置棋子是当前玩家';
    }

    return await ruleApi.isLegalMove(
        srcRow: srcPiece.row,
        srcCol: srcPiece.col,
        dstRow: dstPiece.row,
        dstCol: dstPiece.col);
  }

  // 若鼠标所选位置没有（空）棋子，则返回null
  List<int?> getNearestChessPos(Offset localPosition) {
    int? finalRow;
    int? finalCol;
    const safeRatio = 0.9;
    // x
    final xCorrectLen = localPosition.dx - leftTopOffSet.dx;
    if (xCorrectLen <= 0) {
      finalCol = 1;
    } else {
      final col = xCorrectLen ~/ pieceGap;
      final xModNum = xCorrectLen % pieceGap;
      if (xModNum == 0) {
        finalCol = col + 1;
      } else {
        if (xModNum < (pieceSize / 2) * safeRatio) {
          finalCol = col + 1;
        } else if (xModNum > (pieceGap - pieceSize / 2 * safeRatio)) {
          finalCol = col + 2;
        }
      }
    }

    // y
    final yCorrectLen = localPosition.dy - leftTopOffSet.dy;
    if (yCorrectLen <= 0) {
      finalRow = 1;
    } else {
      final row = yCorrectLen ~/ pieceGap;
      final yModNum = yCorrectLen % pieceGap;
      if (yModNum == 0) {
        finalRow = row + 1;
      } else {
        if (yModNum < (pieceSize / 2) * safeRatio) {
          finalRow = row + 1;
        } else if (yModNum > (pieceGap - pieceSize / 2 * safeRatio)) {
          finalRow = row + 2;
        }
      }
    }
    return [finalRow, finalCol];
  }

  Piece? getChessPosFromOffset(Offset localPosition) {
    final nearestPos = getNearestChessPos(localPosition);

    var row = nearestPos[0];
    var col = nearestPos[1];
    if (row != null && col != null) {
      // 从_pieces中返回该位置的piece引用
      for (var piece in pieces) {
        if (piece.row == row && piece.col == col) {
          return piece;
        }
      }
    }
    return null;
  }

  Future<bool> sendCommandToUcciEngine(String command, Player player,
      {int waitMSec = 1000, String? checkStr}) async {
    return await ucciApi.writeToProcess(
        command: command,
        msec: waitMSec,
        player: player,
        checkStrOption: checkStr);
  }

  bool isEnginesEmpty() {
    return enginePaths.isEmpty;
  }

  // Future<void> onLoadEngine(BuildContext context, Player player) async {
  Future<void> onLoadEngine(String enginePath, Player player) async {
    if (enginePath.isEmpty) {
      throw "错误：在加载引擎前，获取到了空引擎路径";
    }
    //↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓正式加载引擎↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    if (!enginePaths.contains(enginePath)) {
      enginePaths.add(enginePath);
    }

    // 引擎进程启动
    if (!await _loadUcciEngine(enginePath, player)) {
      _setEngineLoaded(player, false);
      toast("引擎初始化失败");
      return;
    }

    // 用“ucci”、”uci“指令测试引擎是否收发正常
    const maxFailedNum = 6;
    var failedCnt = 0;
    bool useUciCommand = false;
    while (true) {
      final cmd = useUciCommand
          ? sendCommandToUcciEngine("uci", player, checkStr: "uciok")
          : sendCommandToUcciEngine("ucci", player, checkStr: "ucciok");
      if (await cmd) {
        await setEngineName(player);

        // 更新引擎字典
        var tmpName = await ucciApi.getEngineName(player: player);
        if (tmpName.isNotEmpty) {
          enginePathMap[tmpName] = enginePath;
        }

        _setEngineLoaded(player, true);
        toast("引擎加载成功");
        break;
      }
      failedCnt++;
      if (failedCnt >= maxFailedNum) {
        toast("尝试了$failedCnt次，仍无法收到引擎反馈");
        return;
      }
      useUciCommand = !useUciCommand;
    }
    //↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑正式加载引擎↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
  }

  Future<void> onUnloadEngine(Player player) async {
    if (!getEngineLoaded(player)) {
      throw "逻辑错误，并未加载引擎，无需卸载";
    }
    if (!await _unloadUcciEngine(player)) {
      toast("引擎卸载失败");
      return;
    }

    setEngineName(player);
    _setEngineLoaded(player, false);

    toast("引擎卸载成功");
  }

  bool getEngineLoaded(Player player) {
    switch (player) {
      case Player.Red:
        return _isRedEngineLoaded.value;
      case Player.Black:
        return _isBlackEngineLoaded.value;
    }
  }

  _setEngineLoaded(Player player, bool LoadedOrNot) {
    switch (player) {
      case Player.Red:
        _isRedEngineLoaded.value = LoadedOrNot;
        break;
      case Player.Black:
        _isBlackEngineLoaded.value = LoadedOrNot;
        break;
    }
  }

  Future<bool> _loadUcciEngine(String path, Player player) async {
    _engineCallback.bindStream(
        ucciApi.subscribeUcciEngine(player: player, enginePath: path));
    return await ucciApi.isProcessLoaded(msec: 3000, player: player);
  }

  Future<bool> _unloadUcciEngine(Player player) async {
    final r1 =
        await sendCommandToUcciEngine("quit", player /* , checkStr: "bye" */);
    final r2 = await ucciApi.isProcessUnloaded(player: player, msec: 2000);

    if (!r1 || !r2) return false;
    // _engineCallback.close();//TODO:在没有unbind方法前，还是什么都不做为秒
    return true;
  }

  String getEngineName(Player player) {
    switch (player) {
      case Player.Red:
        return _redEngineName.isEmpty ? "(人类)" : _redEngineName.value;
      case Player.Black:
        return _blackEngineName.isEmpty ? "(人类)" : _blackEngineName.value;
    }
  }

  Future<void> setEngineName(Player player) async {
    var tmpName = await ucciApi.getEngineName(player: player);
    if (tmpName.isEmpty) {
      tmpName = "(人类)";
    }
    switch (player) {
      case Player.Red:
        _redEngineName.value = tmpName;
        break;
      case Player.Black:
        _blackEngineName.value = tmpName;
        break;
    }
  }
}
