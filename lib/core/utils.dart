class Utils {
  static String durationToTime(Duration duration) {
    return '${duration.inMinutes.toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  }

  static double durationPercentage(Duration totalDuration, Duration currentDuration) {
    final result = (currentDuration.inMilliseconds / totalDuration.inMilliseconds) * 100;
    return result.isNaN ? 0.0 : result;
  }

  static String calculateTimeDifferenceFromDateTime(DateTime targetTime) {
    DateTime now = DateTime.now();

    Duration difference = now.difference(targetTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()}w';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()}mo';
    } else {
      // Approximate years, considering 365.25 days in a year on average
      int years = (difference.inDays / 365.25).floor();
      return '$years ${(years == 1) ? 'y' : 'y'}';
    }
  }
}
