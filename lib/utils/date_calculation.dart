import 'package:intl/intl.dart';

class DateCalculation {
  void sortProductsByDaysDifference(List<Map<String, dynamic>> products) {

    List<Map<String, dynamic>> convertedProducts = products.map((item) => item as Map<String, dynamic>).toList();

    products.sort((a, b) {
      final daysDifferenceA = calculateDaysDifference(a["dlc"]);
      final daysDifferenceB = calculateDaysDifference(b["dlc"]);
      return daysDifferenceA.compareTo(daysDifferenceB);
    });
  }

// Function to calculate the difference in days between two dates
  int calculateDaysDifference(String dlc) {
    final dateFormat = DateFormat('dd/MM/yy');
    final dlcDate = dateFormat.parse(dlc); // Parse DLC string to DateTime
    final today = DateTime.now();
    //final color = getColorByDaysDifference(daysDifference);

    // Remove time components from dates for accurate comparison
    final normalizedDlcDate = DateTime(dlcDate.year, dlcDate.month, dlcDate.day);
    final normalizedToday = DateTime(today.year, today.month, today.day);

    final difference = normalizedDlcDate.difference(normalizedToday).inDays;

    if (normalizedDlcDate.isAtSameMomentAs(normalizedToday)) {
      return 0; // Dates are the same, return 0 days difference
    } else {
      return difference.abs(); // Return absolute difference in days
    }
  }
}
