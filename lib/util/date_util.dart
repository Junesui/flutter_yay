class DateUtil {
  /// 时间戳的秒数 格式化为 xxx前
  static String format(int second) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(int.parse(second.toString()) * 1000);
    const num oneMINUTE = 60000;
    const num oneHOUR = 3600000;
    const num oneDAY = 86400000;
    const num oneWEEK = 604800000;

    const String oneSecondAgo = "秒前";
    const String oneMinuteAgo = "分钟前";
    const String oneHourAgo = "小时前";
    const String oneDayAgo = "天前";
    const String oneMonthAgo = "月前";
    const String oneYearAgo = "年前";

    num delta = DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;
    if (delta < 1 * oneMINUTE) {
      num seconds = toSeconds(delta);
      return (seconds <= 0 ? 1 : seconds).toInt().toString() + oneSecondAgo;
    }
    if (delta < 60 * oneMINUTE) {
      num minutes = toMinutes(delta);
      return (minutes <= 0 ? 1 : minutes).toInt().toString() + oneMinuteAgo;
    }
    if (delta < 24 * oneHOUR) {
      num hours = toHours(delta);
      return (hours <= 0 ? 1 : hours).toInt().toString() + oneHourAgo;
    }
    if (delta < 48 * oneHOUR) {
      return "昨天";
    }
    if (delta < 30 * oneDAY) {
      num days = toDays(delta);
      return (days <= 0 ? 1 : days).toInt().toString() + oneDayAgo;
    }
    if (delta < 12 * 4 * oneWEEK) {
      num months = toMonths(delta);
      return (months <= 0 ? 1 : months).toInt().toString() + oneMonthAgo;
    } else {
      num years = toYears(delta);
      return (years <= 0 ? 1 : years).toInt().toString() + oneYearAgo;
    }
  }

  static num toSeconds(num date) {
    return date / 1000;
  }

  static num toMinutes(num date) {
    return toSeconds(date) / 60;
  }

  static num toHours(num date) {
    return toMinutes(date) / 60;
  }

  static num toDays(num date) {
    return toHours(date) / 24;
  }

  static num toMonths(num date) {
    return toDays(date) / 30;
  }

  static num toYears(num date) {
    return toMonths(date) / 365;
  }
}
