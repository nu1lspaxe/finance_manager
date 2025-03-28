import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Errors {
  static String errInvalidEmail(BuildContext context) =>
      AppLocalizations.of(context)!.errInvalidEmail;

  static String errInvalidPassword(BuildContext context) =>
      AppLocalizations.of(context)!.errInvalidPassword;

  static String errEmptyField(BuildContext context) =>
      AppLocalizations.of(context)!.errEmptyField;

  static String errInvalidNumber(BuildContext context) =>
      AppLocalizations.of(context)!.errInvalidNumber;

  static String errNotPositive(BuildContext context) =>
      AppLocalizations.of(context)!.errNotPositive;

  static String errNoSelected(BuildContext context) =>
      AppLocalizations.of(context)!.errNoSelected;
}