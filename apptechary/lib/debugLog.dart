import 'package:ansicolor/ansicolor.dart';

class DebugLog{
  static void logInfo(param){
    AnsiPen ansiPen = AnsiPen()..green(bg: false);
    print(ansiPen(param));
  }

  static void logWarning(param){
    AnsiPen ansiPen = AnsiPen()..yellow(bg: true)..white();
  }
}