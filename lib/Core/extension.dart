import '../Services/shared_helper.dart';

extension StringExtension on String {
  String translate() {
    return SharedHelper.getTranslatedText(this);
  }
}
