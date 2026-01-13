extension IntExt on int {
  String formatMinutesToHourMinute() {
    if (this <= 0) return '0m';

    final hours = this ~/ 60;
    final remainingMinutes = this % 60;

    if (hours == 0) {
      return '${remainingMinutes}m';
    }

    if (remainingMinutes == 0) {
      return '${hours}h';
    }

    return '${hours}h ${remainingMinutes}m';
  }

}