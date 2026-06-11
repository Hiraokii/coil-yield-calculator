import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('pt')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Coil Yield Calculator'**
  String get appTitle;

  /// No description provided for @resetButton.
  ///
  /// In en, this message translates to:
  /// **'Reset All Calculations'**
  String get resetButton;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @headerTitle.
  ///
  /// In en, this message translates to:
  /// **'Coil Yield Calculator'**
  String get headerTitle;

  /// No description provided for @headerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Estimate roll length and part quantity'**
  String get headerSubtitle;

  /// No description provided for @addNewCalc.
  ///
  /// In en, this message translates to:
  /// **'New calc added'**
  String get addNewCalc;

  /// No description provided for @calculateYield.
  ///
  /// In en, this message translates to:
  /// **'Calculate Yield'**
  String get calculateYield;

  /// No description provided for @calculating.
  ///
  /// In en, this message translates to:
  /// **'Calculating...'**
  String get calculating;

  /// No description provided for @newCalculation.
  ///
  /// In en, this message translates to:
  /// **'New Calculation'**
  String get newCalculation;

  /// No description provided for @lastCalculation.
  ///
  /// In en, this message translates to:
  /// **'Last Calculation'**
  String get lastCalculation;

  /// No description provided for @estimatedPieces.
  ///
  /// In en, this message translates to:
  /// **'Estimated Pieces'**
  String get estimatedPieces;

  /// No description provided for @totalRollLength.
  ///
  /// In en, this message translates to:
  /// **'Total Roll Length'**
  String get totalRollLength;

  /// No description provided for @pcs.
  ///
  /// In en, this message translates to:
  /// **' pcs'**
  String get pcs;

  /// No description provided for @m.
  ///
  /// In en, this message translates to:
  /// **' m'**
  String get m;

  /// No description provided for @outerDiameterLabel.
  ///
  /// In en, this message translates to:
  /// **'Outer diameter:'**
  String get outerDiameterLabel;

  /// No description provided for @innerDiameterLabel.
  ///
  /// In en, this message translates to:
  /// **'Inner diameter:'**
  String get innerDiameterLabel;

  /// No description provided for @thicknessLabel.
  ///
  /// In en, this message translates to:
  /// **'Thickness:'**
  String get thicknessLabel;

  /// No description provided for @pitchLabel.
  ///
  /// In en, this message translates to:
  /// **'Pitch:'**
  String get pitchLabel;

  /// No description provided for @mm.
  ///
  /// In en, this message translates to:
  /// **'mm'**
  String get mm;

  /// No description provided for @recentCalculations.
  ///
  /// In en, this message translates to:
  /// **'Recent Calculations'**
  String get recentCalculations;

  /// No description provided for @noCalculations.
  ///
  /// In en, this message translates to:
  /// **'No calculations available yet'**
  String get noCalculations;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
