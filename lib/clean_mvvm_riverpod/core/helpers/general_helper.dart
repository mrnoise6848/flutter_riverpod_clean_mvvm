import 'package:intl/intl.dart';
import 'package:test_riverpod/clean_mvvm_riverpod/core/utils/enums.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralUtils {
  static String replaceNumbers(String input, LocaleType convertTo) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < farsi.length; i++) {
      input = input.replaceAll(convertTo == LocaleType.fa ? english[i] : farsi[i], convertTo == LocaleType.fa ? farsi[i] : english[i]);
    }
    return input;
  }

  String convertToPrice(int price) {
    return NumberFormat("###,###").format(price); // 200,000
  }

  Future<void> openUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
