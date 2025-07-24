import 'package:flutter/material.dart';

void showBasicBottomSheet(BuildContext context, {required Widget child}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // For full height if needed
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: child,
      );
    },
  );
}
