extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return 'Unknown'; // Return the original string if it's empty
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
