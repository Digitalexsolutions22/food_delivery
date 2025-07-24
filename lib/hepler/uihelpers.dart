import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:html/parser.dart' as html_parser;
// import 'package:intl/intl.dart';

String formatPriceFromPaiseString(String? paiseStr) {
  if (paiseStr == null || paiseStr.isEmpty) return '₹0';

  final paise = int.tryParse(paiseStr);
  if (paise == null) return '₹0';

  final rupees = paise ~/ 100;
  return '$rupees';
}

// convert 5.00 to  5 & 3.5 to 3.5

num parseCleanNumber(String value) {
  final doubleVal = double.tryParse(value) ?? 0;
  if (doubleVal % 1 == 0) {
    return doubleVal.toInt();
  }
  return doubleVal;
}

String htmlToPlainText(String htmlString) {
  return html_parser.parse(htmlString).body?.text.trim() ?? '';
}

String timeAgo(String dateTimeString) {
  // Parse the server datetime
  final serverDateTime = DateTime.parse(dateTimeString);

  // Adjust for IST (UTC+5:30)
  final adjustedDateTime = serverDateTime.add(
    const Duration(hours: 5, minutes: 30),
  );

  // Current local time
  final now = DateTime.now();

  // Difference between now and adjusted server time
  final diff = now.difference(adjustedDateTime);

  if (diff.inDays >= 365) {
    int years = (diff.inDays / 365).floor();
    return "$years year${years > 1 ? 's' : ''} ago";
  } else if (diff.inDays >= 30) {
    int months = (diff.inDays / 30).floor();
    return "$months month${months > 1 ? 's' : ''} ago";
  } else if (diff.inDays >= 1) {
    return "${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago";
  } else if (diff.inHours >= 1) {
    return "${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} ago";
  } else if (diff.inMinutes >= 1) {
    return "${diff.inMinutes} minute${diff.inMinutes > 1 ? 's' : ''} ago";
  } else {
    return "just now";
  }
}

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;

  const ExpandableText(this.text, {this.trimLines = 3, super.key});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          textAlign: TextAlign.justify,
          maxLines: isExpanded ? null : widget.trimLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.deepGreen,
          ),
        ),
        InkWell(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Text(
            isExpanded ? "Show less" : "Read more",
            style: const TextStyle(color: AppColors.gray),
          ),
        ),
      ],
    );
  }
}

// convert 5000 to 50.00
String formatPrice(String price, int currencyMinorUnit) {
  try {
    double value = int.parse(price) / pow(10, currencyMinorUnit);
    return value.toStringAsFixed(currencyMinorUnit);
  } catch (e) {
    return price; // fallback if parsing fails
  }
}

double formatAmount(String amount) {
  int value = int.parse(amount);
  return value / 100;
}

String formatApiDate(String dateStr) {
  DateTime serverDateTime = DateTime.parse(dateStr);

  // Apply IST (Indian Standard Time) offset: +5 hours 30 minutes
  final adjustedDateTime = serverDateTime.add(
    const Duration(hours: 5, minutes: 30),
  );

  // Short month names
  const monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  String month = monthNames[adjustedDateTime.month - 1];
  String day = adjustedDateTime.day.toString();

  int hour = adjustedDateTime.hour;
  int minute = adjustedDateTime.minute;
  String period = "AM";

  // Convert to 12-hour format
  if (hour >= 12) {
    period = "PM";
    if (hour > 12) hour -= 12;
  } else if (hour == 0) {
    hour = 12;
  }

  String minuteStr = minute.toString().padLeft(2, '0');

  return "$month $day - $hour:$minuteStr $period";
}
