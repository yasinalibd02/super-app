// ignore: library_prefixes
import 'dart:developer' as debugLog;

import 'package:flutter/material.dart';

///* Type of [Debuggers]

///* info
///* error
///* normal
///* Success
///* warning

class Debuggers {
  final Function({String? logTitle}) i, s;
  final Function({String? logTitle, dynamic stackTrace}) e, w;

  Debuggers({
    required this.s,
    required this.e,
    required this.w,
    required this.i,
  });
}

///* ANSI Color Code
///* Text Colors
const String blackColor = '\u001b[30m';
const String redColor = '\u001b[31m';
const String greenColor = '\u001b[32m';
const String yellowColor = '\u001b[33m';
const String orangeColor = '\u001b[38;5;208m';
const String blueColor = '\u001b[34m';
const String magentaColor = '\u001b[35m';
const String cyanColor = '\u001b[36m';
const String whiteColor = '\u001b[37m';
const String resetColor = '\u001b[0m';

///* Text Background colors
const String blackBgColor = '\u001b[40m';
const String redBgColor = '\u001b[41m';
const String greenBgColor = '\u001b[42m';
const String yellowBgColor = '\u001b[43m';
const String blueBgColor = '\u001b[44m';
const String magentaBgColor = '\u001b[45m';
const String cyanBgColor = '\u001b[46m';
const String whiteBgColor = '\u001b[47m';

///* Debug Colors enum [DebugColor]
enum DebugColor {
  black,
  red,
  green,
  yellow,
  orange,
  blue,
  magenta,
  cyan,
  white,
}

///* Debug Token [DebugToken]

class DebugToken {
  static String success({String? logTitle = '', required String logMessage}) {
    return '$greenColor${(logTitle == '' ? '✅ SUCCESS' : "✅ ${logTitle!.toUpperCase()} ")}: $greenColor$logMessage';
  }

  static String info({String? logTitle = '', required String logMessage}) {
    return '''$cyanColor ${(logTitle == '' ? 'INFO' : logTitle!.toUpperCase())}
$cyanColor ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
$cyanColor │ 💡 ${logMessage.toString().split('\n').join('\n │ 💡')} 
$cyanColor └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────''';
  }

  static String warning({
    String? logTitle = '',
    required String logMessage,
    required var stackTrace,
  }) {
    return '''$orangeColor ${(logTitle == '' ? 'WARNING' : logTitle!.toUpperCase())}
$orangeColor ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
$orangeColor │ ${stackTrace.toString().trimLeft().trimRight().split('\n')[0]}
$orangeColor │ ${stackTrace.toString().trimLeft().trimRight().split('\n')[1]} 
$orangeColor ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
$orangeColor │ ⚠️ ${logMessage.toString().split('\n').join('\n │')}  
$orangeColor └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────''';
  }

  static String error({
    String? logTitle = '',
    required String logMessage,
    required var stackTrace,
  }) {
    return '''
$redColor ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
$redColor │ $redBgColor$whiteColor${(logTitle == '' ? ' Error ' : " ${logTitle!.toUpperCase()} ")}
$redColor ├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
$redColor │ ${stackTrace.toString().trimLeft().trimRight().split('\n')[0]}
$redColor │ ${stackTrace.toString().trimLeft().trimRight().split('\n')[1]}                               
$redColor ├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
$redColor │ ⛔️ ${logMessage.toString().split('\n').join('\n │')}  
$redColor └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────''';
  }

  static String normal({
    DebugColor? debugColor = DebugColor.white,
    required String logMessage,
  }) {
    var color = debugColor == DebugColor.black
        ? blackColor
        : debugColor == DebugColor.red
            ? redColor
            : debugColor == DebugColor.green
                ? greenColor
                : debugColor == DebugColor.yellow
                    ? yellowColor
                    : debugColor == DebugColor.orange
                        ? orangeColor
                        : debugColor == DebugColor.blue
                            ? blueColor
                            : debugColor == DebugColor.magenta
                                ? magentaColor
                                : debugColor == DebugColor.cyan
                                    ? cyanColor
                                    : whiteColor;

    return '''
$color ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
$color │ ${logMessage.toString().split('\n').join('\n │')}  
$color └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────''';
  }
}

///* set extension value
extension SetDebugger on String {
  get success => ({String? logTitle = ''}) {
        DebugToken.success(
          logTitle: logTitle,
          logMessage: this,
        ).debugger();
      };
  get warning => ({String? logTitle = '', stackTrace}) {
        debugPrint(
          DebugToken.warning(
            logTitle: logTitle,
            logMessage: this,
            stackTrace: stackTrace ?? StackTrace.current,
          ),
        );
      };
  get info => ({String? logTitle = ''}) {
        DebugToken.info(
          logTitle: logTitle,
          logMessage: this,
        ).debugger();
      };

  get error => ({String? logTitle = '', stackTrace}) {
        debugPrint(
          DebugToken.error(
            logMessage: this,
            logTitle: logTitle,
            stackTrace: stackTrace ?? StackTrace.current,
          ),
        );
      };

  get normal => ({
        DebugColor? logColor = DebugColor.white,
      }) {
        DebugToken.normal(
          debugColor: logColor,
          logMessage: this,
        ).debugger();
      };

  get debugger => () {
        debugLog.log(this);
      };
}

///* USING THE MAIN EXTENSION
extension SupperDebugger on String {
  Null Function({DebugColor? logColor}) get showDebug => normal;
  Debuggers get debugType => Debuggers(
        s: success,
        e: error,
        w: warning,
        i: info,
      );
}



/*
 * {Example how to use "DEBUGGERS"}
 * 
 InkWell(
   onTap: () {
     'Output'.showDebug();
     'Result'.debugType.s();
     'Result'.debugType.e();
     'Result'.debugType.w();
     'Result'.debugType.i();
          },
        child: anyThing...
        )
*/