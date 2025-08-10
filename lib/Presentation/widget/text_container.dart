import 'package:flutter/material.dart';
class TextContainer extends StatelessWidget {
  final String textOne;
  final String textTWo;
  const TextContainer({
     required this.textOne, required this.textTWo,super.key
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0,bottom: 8),
          child: Text(textOne,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
        Flexible(
          child: Text(
            textTWo,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
        )
      ],
    );
  }
}