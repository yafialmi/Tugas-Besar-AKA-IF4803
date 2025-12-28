import 'package:flutter/material.dart';
import 'package:manajemen_gudang/colors/color.dart';

class FormFieldLargeWidgets extends StatelessWidget {
  final String errorMessage, labelText, hintText;
  final TextEditingController controller;
  const FormFieldLargeWidgets({
    required this.errorMessage,
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: controller,
        maxLines: 20,
        minLines: 5,
        textInputAction: TextInputAction.next,
        cursorColor: AppColor.primary,
        enabled: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
          ),
          hintStyle: const TextStyle(color: AppColor.placeholder),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(20),
          fillColor: Colors.white,
          focusColor: AppColor.primary,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIconColor: Colors.black,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      ),
    );
  }
}

class FormFieldSearchWidgets extends StatelessWidget {
  final String errorMessage, labelText, hintText;
  final TextEditingController controller;
  const FormFieldSearchWidgets({
    required this.errorMessage,
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: controller,
        cursorColor: AppColor.primary,
        textInputAction: TextInputAction.next,
        enabled: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
          ),
          hintStyle: const TextStyle(color: AppColor.placeholder),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(20),
          fillColor: Colors.white,
          focusColor: AppColor.primary,
          prefixIcon: Icon(Icons.search, color: AppColor.textBlack),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIconColor: Colors.black,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      ),
    );
  }
}

class FormFieldWidgets extends StatelessWidget {
  final String errorMessage, labelText, hintText;
  final TextEditingController controller;
  const FormFieldWidgets({
    required this.errorMessage,
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: controller,
        cursorColor: AppColor.primary,
        textInputAction: TextInputAction.next,
        enabled: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
          ),
          hintStyle: const TextStyle(color: AppColor.placeholder),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(20),
          fillColor: Colors.white,
          focusColor: AppColor.primary,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIconColor: Colors.black,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      ),
    );
  }
}
