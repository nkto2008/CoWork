import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'custom_text.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final bool backward;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.backward,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding * 2, vertical: defaultPadding),
        child: Row(
          children: [
            if (widget.backward)
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: primaryColor),
                ),
              ),
            const SizedBox(width: defaultPadding),
            CustomText(
              text: widget.title,
              size: 30,
              color: primaryColor,
              font: "Comfortaa",
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
