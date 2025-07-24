import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/fonts.dart';

class Descriptioninputfield extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Color backgroundColor;
  final int maxWords, maxlines; // new property

  const Descriptioninputfield({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.validator,
    this.backgroundColor = AppColors.white,
    this.isPassword = false,
    this.maxlines = 20,
    this.maxWords = 3000, // default to 3000
  });

  @override
  State<Descriptioninputfield> createState() => _DescriptioninputfieldState();
}

class _DescriptioninputfieldState extends State<Descriptioninputfield> {
  final ScrollController scrollController = ScrollController();
  int currentLines = 1;
  final int maxLines = 5;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateLines);
  }

  void _updateLines() {
    final lines = widget.controller.text.split('\n').length;
    if (lines != currentLines) {
      setState(() {
        currentLines = lines > maxLines ? maxLines : lines;
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  final ValueNotifier<bool> _isFocused = ValueNotifier(false);

  String? _validateWordCount(String? value) {
    if (value != null && value.split(' ').length > widget.maxWords) {
      return 'Exceeds maximum word limit of ${widget.maxWords}';
    }
    return widget.validator?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isFocused,
      builder: (context, isFocused, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          constraints: const BoxConstraints(
            minHeight: 150, // minimum height for larger space
          ),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(15),
            border:
                isFocused
                    ? Border.all(color: AppColors.limeGreen, width: 2)
                    : Border.all(color: AppColors.gray),
          ),
          child: Focus(
            onFocusChange: (focus) => _isFocused.value = focus,
            child: TextFormField(
              scrollController: scrollController,
              controller: widget.controller,
              keyboardType: TextInputType.multiline,
              minLines: 5, // minimum lines to start with
              maxLines: maxLines,

              validator: _validateWordCount,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontFamily: AppFonts.roboto,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                  color: AppColors.gray,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        );
      },
    );
  }
}
