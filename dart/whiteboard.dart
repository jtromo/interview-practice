import 'package:intl/intl.dart';

void main() {
//   DateTime time = DateTime.parse("7/25/2023 12:00:00 AM");

//   var inputFormat = DateFormat('M/d/yyyy hh:mm:ss aaa');
//   var time = inputFormat.parse('7/25/2023 02:30:01 AM');
//   print(time);

//   var time2 = DateTime.parse("2023-07-25T00:00:00.000TZ");
//   var time2 = DateTime.parse("2023-07-25 00:00:00.000Z");
//   print(time2);

//    var time3 = DateTime.parse("2023-07-26T16:00:00.000Z");
//    print(time3);

//   var dateString = "2023-07-25T00:00:00.000TZ";
//   dateString = dateString.replaceAll(RegExp(r'T'), ' '); // 'résumé'
//   var time2 = DateTime.parse(dateString);
//   print(time2);

//   String serial = "990000005-1";
//   //Removes everything after first '.'
//   String result = serial.substring(0, serial.indexOf('-'));
//   print(result);

//   var inputFormat = DateFormat('M/d/yyyy hh:mm:ss aaa');
//   var time = inputFormat.parse('7/25/2023 02:30:01 AM');
//   print(time);
//   // format: Wed 3:17 PM
//   var formatter = DateFormat('EEE h:mm aaa');
//   print(formatter.format(time));

//      var time4 = DateTime.parse("2023-07-26T16:00:00.000Z");
//   // TODAY, 03 AUG 2023
//      var formatterChart = DateFormat('EEE h:mm aaa');
//     print("TODAY, " + formatterChart.format(time4));

//   var time5 = DateTime.parse("2023-08-02T16:00:00.000Z");
//   // WED, 02 AUG 2023
//      var formatterChart2 = DateFormat('EEE, dd MMM yyyy');
//     print(formatterChart2.format(time5).toUpperCase());

//   int x = 83;
//   int divisor = 10;
//   int minResult = (x / divisor).floor() * divisor;
//   print(minResult);
//   int maxResult = (x / divisor).ceil() * divisor;
//   print(maxResult);

//   int maxXAxisLines = 8;

//   double min = 16;
//   double max = 227;

//     double diff = max - min;

//     int divisor = 10;
//     int result = (diff / divisor).ceil() * divisor;
//   print("diff: ${diff}");
//   print("Nearest 10: ${result}");
//   print("maxXAxisLines: ${maxXAxisLines}");
//   print("interval");
//   print((result/maxXAxisLines).ceil());

//   int input = 12;
//   var formatter = NumberFormat('###,##0');
//  print(formatter.format(input));

  /// In accordance with ISO 8601
  /// a week starts with Monday, which has the value 1.
  int btWeekdayForIsoWeekday(int weekday) {
    if (weekday == 7) {
      // Sunday
      return 0;
    }
    return weekday;
  }

  // Week day methods

//   int daysBetween(DateTime from, DateTime to) {
//     from = DateTime(from.year, from.month, from.day);
//     print(from);
//     to = DateTime(to.year, to.month, to.day);
//     print(to);
//     return (to.difference(from).inHours / 24).round();
//   }

//   // Is the selected date during the current week?
//   DateTime currentDate = DateTime.now();
//   print('currentDate ' + currentDate.toString());
//   DateTime _displayedDate =
//       DateTime(currentDate.year, currentDate.month, currentDate.day)
//           .subtract(Duration(days: 3));
//   print('_displayedDate ' + _displayedDate.toString());
//   print(_displayedDate.weekday);
//   // start of this week
//   DateTime startOfThisWeek = currentDate
//       .subtract(Duration(days: btWeekDayForIsoWeekday(currentDate.weekday)));
//   // convert selected date to start of week
//   DateTime selectedDateStartOfWeek = _displayedDate
//       .subtract(Duration(days: btWeekDayForIsoWeekday(_displayedDate.weekday)));
//   print('startOfThisWeek ' + startOfThisWeek.toString());
//   print('selectedDateStartOfWeek ' + selectedDateStartOfWeek.toString());

//   // subtract
//   var daysSince = daysBetween(selectedDateStartOfWeek, startOfThisWeek);
//   print(daysSince);
//   if (daysSince != 0) {
//     print('false');
//   } else {
//     print('true');
//   }

//   DateTime date = DateTime.now();
//   print('Start date: ${date.toString()}');
//   int weekday = date.weekday;
  
  
//   DateTime startWeekday = date.subtract(
//         Duration(days: btWeekdayForIsoWeekday(date.weekday)));
//   print('startWeekday: ${startWeekday.toString()}');
  
//   int endWeekDiff = DateTime.saturday - weekday;
//   DateTime endWeekday = date.add(Duration(days: endWeekDiff));
//   print('endWeekday: ${endWeekday.toString()}');
  
  // fix water meter date
//   var x = "2023-07-25T00:00:00.000TZ";
//   print(x);
  
// //   var position = x.lastIndexOf("T").clamp(0, x.length);
// // var x2 = x.replaceFirst("T", "", position);
// //   print(x2);
  
//   String replaceCharAt(String oldString, int index, String newChar) {
//   return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
// }

  
//   if (x[x.length-2] == "T") {
//     x = replaceCharAt(x, x.length-2, "");
// //     x[x.length-2] = "";
//     print(x);
//   }
  
  
}
