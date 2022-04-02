import 'package:flutter/material.dart';
import 'package:norwegian_cruise_lines/theme/custom_colors.dart';
import 'package:norwegian_cruise_lines/theme/styles.dart';

class ShipTypeDataWidget extends StatelessWidget {
  final String label;
  final String value;
  const ShipTypeDataWidget({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '$label:',
              style: Styles.subtitle2(
                color: CustomColors.grey800,
              ),
            ),
          ),
          const Expanded(
            flex: 0,
            child: SizedBox(
              width: 20,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Styles.subtitle2(
                color: CustomColors.grey800,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
