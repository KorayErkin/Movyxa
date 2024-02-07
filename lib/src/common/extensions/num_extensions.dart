// ignore_for_file: prefer_interpolation_to_compose_strings

extension NumExtension on num {
  String convertToPercentageString() {
    return ((this) * 10).toStringAsFixed(0) + ' ✨';
  }
}