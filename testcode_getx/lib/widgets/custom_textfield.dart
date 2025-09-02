import 'package:flutter/material.dart';
import 'package:testcode/core/constants/color_const.dart';

class CustomCupertinoField extends StatelessWidget {
  final double? aboveSpacing;

  final EdgeInsetsGeometry padding;

  final FormFieldValidator? validator;
  final AutovalidateMode? autoValidateMode;
  final String? labelText;
  final String? hintText;
  final int? minLines;
  final int? maxLines;
  final FocusNode? focusNode;
  final String? validationMessage;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomCupertinoField({
    super.key,
    this.validator,
    this.aboveSpacing,
    this.labelText,
    this.focusNode,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.maxLines,
    this.minLines,
    this.autoValidateMode,
    this.hintText,
    this.validationMessage,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: aboveSpacing),
          TextFormField(
            controller: controller,
            minLines: minLines ?? 1,
            maxLines: maxLines ?? 1,
            autovalidateMode: autoValidateMode,
            focusNode: focusNode,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorConst.greyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorConst.getPrimary(),
                  width: 2.0,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return validationMessage;
              }
              return null;
            },
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
