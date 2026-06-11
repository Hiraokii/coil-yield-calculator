// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Calculadora de Rendimento de Bobina';

  @override
  String get resetButton => 'Resetar Todos os Cálculos';

  @override
  String get historyTitle => 'Histórico';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get headerTitle => 'Calculadora de Rendimento de Bobina';

  @override
  String get headerSubtitle => 'Estimar comprimento do rolo e quantidade de peças';

  @override
  String get addNewCalc => 'Novo cálculo adicionado';

  @override
  String get calculateYield => 'Calcular Rendimento';

  @override
  String get calculating => 'Calculando...';

  @override
  String get newCalculation => 'Nova Calculação';

  @override
  String get lastCalculation => 'Último Cálculo';

  @override
  String get estimatedPieces => 'Peças Estimadas';

  @override
  String get totalRollLength => 'Comprimento Total do Rolo';

  @override
  String get pcs => ' pcs';

  @override
  String get m => ' m';

  @override
  String get outerDiameterLabel => 'Diâmetro externo:';

  @override
  String get innerDiameterLabel => 'Diâmetro interno:';

  @override
  String get thicknessLabel => 'Espessura:';

  @override
  String get pitchLabel => 'Passo:';

  @override
  String get mm => 'mm';

  @override
  String get recentCalculations => 'Cálculos Recentes';

  @override
  String get noCalculations => 'Nenhum cálculo disponível ainda';
}
