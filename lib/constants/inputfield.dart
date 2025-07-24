import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/fonts.dart';

class InputField extends StatefulWidget {
  final String? text, icon;
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword, readonly, darkfont;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  // final String? imageUrl;
  final FocusNode? focusNode;
  final VoidCallback? ontap;
  final double borderRadius;
  final double? height;

  const InputField({
    super.key,
    this.text,
    this.height = 30,
    this.icon,
    this.controller,
    // this.imageUrl,
    this.hintText,
    this.isPassword = false,
    this.readonly = false,
    this.darkfont = false,
    this.keyboardType,
    this.validator,
    this.focusNode,
    this.ontap,
    this.borderRadius = 555,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            onTap: widget.ontap,
            readOnly: widget.readonly,
            focusNode: widget.focusNode,
            controller: widget.controller,
            obscureText: widget.isPassword ? isObscure : false,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(color: AppColors.gray, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: AppColors.gray, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(
                  color: AppColors.green,
                  width: 2.0,
                ),
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontFamily: AppFonts.roboto,
                fontWeight: FontWeight.normal,
                fontSize: 13,
                color: widget.darkfont ? AppColors.black : AppColors.gray,
              ),
              suffixIcon:
                  widget.isPassword
                      ? Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          icon: Icon(
                            isObscure ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.gray,
                          ),
                        ),
                      )
                      : null,
            ),
          ),
        ),
      ],
    );
  }
}
