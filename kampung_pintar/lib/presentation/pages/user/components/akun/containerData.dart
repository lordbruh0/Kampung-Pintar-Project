import 'package:flutter/material.dart';

class InfoRowContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final String subtext;
  final Color iconColor;
  final Color textColor;

  const InfoRowContainer({
    Key? key,
    required this.icon,
    required this.text,
    required this.subtext,
    this.iconColor = const Color(0xFF539DF3),
    this.textColor = const Color(0xFF1B1E28),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFDFE1E6),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
              const SizedBox(width: 16),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
            ],
          ),
          Text(
            "($subtext)",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: textColor.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
