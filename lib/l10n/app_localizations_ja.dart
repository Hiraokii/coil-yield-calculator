// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'コイル収率計算機';

  @override
  String get resetButton => 'すべての計算をリセット';

  @override
  String get historyTitle => '履歴';

  @override
  String get settingsTitle => '設定';

  @override
  String get headerTitle => 'コイル収率計算機';

  @override
  String get headerSubtitle => '巻き長さと部品数を推定';

  @override
  String get addNewCalc => '新しい計算が追加されました';

  @override
  String get calculateYield => '収率を計算';

  @override
  String get calculating => '計算中…';

  @override
  String get newCalculation => '新しい計算';

  @override
  String get lastCalculation => '最後の計算';

  @override
  String get estimatedPieces => '推定部品数';

  @override
  String get totalRollLength => '総巻長';

  @override
  String get pcs => ' pcs';

  @override
  String get m => ' m';

  @override
  String get outerDiameterLabel => '外径:';

  @override
  String get innerDiameterLabel => '内径:';

  @override
  String get thicknessLabel => '板厚:';

  @override
  String get pitchLabel => '送りピッチ:';

  @override
  String get mm => 'mm';

  @override
  String get recentCalculations => '最近の計算';

  @override
  String get noCalculations => '計算履歴はありません';
}
