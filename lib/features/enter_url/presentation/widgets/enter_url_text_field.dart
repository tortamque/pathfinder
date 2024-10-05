import 'package:flutter/material.dart';

class EnterUrlTextField extends StatelessWidget {
  const EnterUrlTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.swap_horiz_rounded),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(),
          ),
        ),
      ],
    );
  }
}
