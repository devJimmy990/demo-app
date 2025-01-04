extension StringExtension on String {
  String capitalize() {
    return split(' ') // Split the string into words
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1)}' // Capitalize first letter
            : word) // Keep empty segments intact
        .join(' ');
  }
}
