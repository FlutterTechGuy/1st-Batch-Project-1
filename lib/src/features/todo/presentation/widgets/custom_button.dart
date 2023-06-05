import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final double? height;
  final double? width;
  final String buttonText;

  const CustomButton(
      {super.key,
      required this.onTap,
      required this.buttonText,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 60,
        width: width ?? 200,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          buttonText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        )),
      ),
    );
  }
}
