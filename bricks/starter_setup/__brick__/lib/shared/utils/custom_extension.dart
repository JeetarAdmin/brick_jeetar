import 'package:intl/intl.dart';
// ignore_for_file: unnecessary_null_comparison

extension CustomDoubleExtension on double {
  formatCurrency({String currencySymbol = '₦'}) {
    // return this == 0 ? '-' : '${currencySymbol ?? ''} ${money.format(this)}';
    return this == null
        ? '-'
        : ((currencySymbol != null ? (currencySymbol + ' ') : '') +
            money.format(this));
  }
}

final money = NumberFormat("#,##0.00", "en_US");

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String shortToLenght(int lenght) {
    if (this.length > length) {
      return this.substring(0, lenght - 1) + "...";
    }

    return this;
  }

  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}

extension IterableX<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    T? firstItem;
    for (var item in this) {
      if (test(item)) {
        firstItem = item;
        break;
      }
    }
    return firstItem;
  }
}

String getDayOfMonthSuffix(int dayNum) {
  if (!(dayNum >= 1 && dayNum <= 31)) {
    throw Exception('Invalid day of month');
  }

  if (dayNum >= 11 && dayNum <= 13) {
    return 'th';
  }

  switch (dayNum % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

formatDate(DateTime date) {
  var suffix = "th";
  var digit = date.day % 10;
  if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
    suffix = ["st", "nd", "rd"][digit - 1];
  }
  return DateFormat("EEEE, dd'$suffix' MMMM").format(date);
}
