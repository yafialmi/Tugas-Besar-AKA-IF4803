import 'package:flutter/material.dart';
import 'package:manajemen_gudang/colors/color.dart';

class CustomCreateTextButton extends StatelessWidget {
  final String normalText, boldText;
  final Function buttonFunction;
  final bool condition;
  const CustomCreateTextButton({
    super.key,
    required this.normalText,
    required this.boldText,
    required this.buttonFunction,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buttonFunction();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(normalText),
            const SizedBox(width: 5),
            condition
                ? const CircularProgressIndicator(color: AppColor.text)
                : Text(
                    boldText,
                    style: const TextStyle(
                      color: AppColor.text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class CustomCreateLogoTextButton extends StatelessWidget {
  final String normalText, boldText;
  final Function buttonFunction;
  final bool condition;
  const CustomCreateLogoTextButton({
    super.key,
    required this.normalText,
    required this.boldText,
    required this.buttonFunction,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buttonFunction();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(normalText),
            const SizedBox(width: 5),
            condition
                ? const CircularProgressIndicator(color: AppColor.text)
                : Row(
                  children: [
                    Icon(Icons.upload, color: AppColor.text),
                    Text(
                        boldText,
                        style: const TextStyle(
                          color: AppColor.text,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
