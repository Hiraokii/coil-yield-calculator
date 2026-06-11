// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Coil Yield Calculator';

  @override
  String get resetButton => 'Reset All Calculations';

  @override
  String get historyTitle => 'History';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get headerTitle => 'Coil Yield Calculator';

  @override
  String get headerSubtitle => 'Estimate roll length and part quantity';

  @override
  String get addNewCalc => 'New calc added';

  @override
  String get calculateYield => 'Calculate Yield';

  @override
  String get calculating => 'Calculating...';

  @override
  String get newCalculation => 'New Calculation';

  @override
  String get lastCalculation => 'Last Calculation';

  @override
  String get estimatedPieces => 'Estimated Pieces';

  @override
  String get totalRollLength => 'Total Roll Length';

  @override
  String get pcs => ' pcs';

  @override
  String get m => ' m';

  @override
  String get outerDiameterLabel => 'Outer diameter:';

  @override
  String get innerDiameterLabel => 'Inner diameter:';

  @override
  String get thicknessLabel => 'Thickness:';

  @override
  String get pitchLabel => 'Pitch:';

  @override
  String get mm => 'mm';

  @override
  String get recentCalculations => 'Recent Calculations';

  @override
  String get noCalculations => 'No calculations available yet';
}
