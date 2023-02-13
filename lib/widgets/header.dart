import 'package:flutter/material.dart';

import '../assets/constants.dart';

enum HeaderSize {
  headerSmall,
  headerMedium,
  headerLarge,
}

class Header extends StatelessWidget {
  Header({
    super.key,
    required this.text,
    this.headerSize = HeaderSize.headerLarge,
  });
  String text;
  HeaderSize headerSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        text,
        style: (headerSize == HeaderSize.headerLarge)
            ? kHeaderTextStyle
            : (headerSize == HeaderSize.headerMedium)
                ? kHeaderTextStyle.copyWith(
                    fontSize: 25, fontWeight: FontWeight.w600)
                : kHeaderTextStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w300),
        textAlign: TextAlign.center,
      ),
    );
  }
}
