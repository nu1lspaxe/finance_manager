import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SourceType {
  bankAccount,
  cash,
}

extension SourceTypeExtension on SourceType {
  String name(BuildContext context) {
    switch (this) {
      case SourceType.bankAccount:
        return AppLocalizations.of(context)!.sourceTypeBankAccount;
      case SourceType.cash:
        return AppLocalizations.of(context)!.sourceTypeCash;
    }
  }
}