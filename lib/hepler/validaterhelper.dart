import 'dart:developer';

String? validateInput(
  String? value,
  String fieldName, {
  bool validateLength = false,
}) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your $fieldName';
  }

  final trimmedValue = value.trim();

  log("length >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${trimmedValue.length}");

  // Conditionally check character length
  if (validateLength && trimmedValue.length > 200) {
    return '$fieldName must not exceed 200 characters';
  }

  final emojiRegex = RegExp(
    r'[\u{1F600}-\u{1F64F}' // emoticons
    r'\u{1F300}-\u{1F5FF}' // symbols & pictographs
    r'\u{1F680}-\u{1F6FF}' // transport & map symbols
    r'\u{1F1E0}-\u{1F1FF}' // flags
    r'\u{2600}-\u{26FF}' // misc symbols
    r'\u{2700}-\u{27BF}]', // dingbats
    unicode: true,
  );

  if (emojiRegex.hasMatch(trimmedValue)) {
    return '$fieldName should not contain emojis';
  }

  return null; // All validations passed
}
