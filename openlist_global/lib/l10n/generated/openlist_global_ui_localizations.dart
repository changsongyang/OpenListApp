import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'openlist_global_ui_localizations_en.dart';
import 'openlist_global_ui_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of OpenListGlobalUiLocalizations
/// returned by `OpenListGlobalUiLocalizations.of(context)`.
///
/// Applications need to include `OpenListGlobalUiLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/openlist_global_ui_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: OpenListGlobalUiLocalizations.localizationsDelegates,
///   supportedLocales: OpenListGlobalUiLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the OpenListGlobalUiLocalizations.supportedLocales
/// property.
abstract class OpenListGlobalUiLocalizations {
  OpenListGlobalUiLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static OpenListGlobalUiLocalizations of(BuildContext context) {
    return Localizations.of<OpenListGlobalUiLocalizations>(
      context,
      OpenListGlobalUiLocalizations,
    )!;
  }

  static const LocalizationsDelegate<OpenListGlobalUiLocalizations> delegate =
      _OpenListGlobalUiLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
    Locale('zh', 'CN'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    Locale('zh', 'TW'),
  ];

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'OpenList'**
  String get app_title;
}

class _OpenListGlobalUiLocalizationsDelegate
    extends LocalizationsDelegate<OpenListGlobalUiLocalizations> {
  const _OpenListGlobalUiLocalizationsDelegate();

  @override
  Future<OpenListGlobalUiLocalizations> load(Locale locale) {
    return SynchronousFuture<OpenListGlobalUiLocalizations>(
      lookupOpenListGlobalUiLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_OpenListGlobalUiLocalizationsDelegate old) => false;
}

OpenListGlobalUiLocalizations lookupOpenListGlobalUiLocalizations(
  Locale locale,
) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return OpenListGlobalUiLocalizationsZhHans();
          case 'Hant':
            return OpenListGlobalUiLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return OpenListGlobalUiLocalizationsZhCn();
          case 'TW':
            return OpenListGlobalUiLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return OpenListGlobalUiLocalizationsEn();
    case 'zh':
      return OpenListGlobalUiLocalizationsZh();
  }

  throw FlutterError(
    'OpenListGlobalUiLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
