import 'package:flutter/material.dart';
import 'package:norwegian_cruise_lines/models/ship/ship_type_model.dart';
import 'package:norwegian_cruise_lines/theme/custom_colors.dart';
import 'package:norwegian_cruise_lines/theme/styles.dart';
import 'package:norwegian_cruise_lines/views/widgets/ship_type_data_widget.dart';

class ShipTypeCardWidget extends StatelessWidget {
  final String shipName;
  final ShipTypeModel? shipType;
  final VoidCallback? onTap;
  final bool isLoading;
  final bool isError;

  const ShipTypeCardWidget({
    Key? key,
    this.onTap,
    required this.shipName,
    this.isLoading = false,
    this.shipType,
    this.isError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            width: _mediaQuery.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 11,
            ),
            child: Row(
              children: [
                Text(
                  '${shipType?.shipName != null ? shipType?.shipName?.toUpperCase() : shipName}',
                  style: Styles.title2(
                    color: CustomColors.grey900,
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 0.5,
              color: CustomColors.grey300,
            ))),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Visibility(
                  visible: shipType?.shipName == null && !isError,
                  child: Text(
                    'Click on the button below to fetch ${shipName.toLowerCase()} data.',
                    textAlign: TextAlign.center,
                    style: Styles.p2(
                      color: CustomColors.grey800,
                    ),
                  ),
                ),
                Visibility(
                  visible: isError,
                  child: Text(
                    'An error occurred while trying to fetch ${shipName.toLowerCase()} data. Please reload.',
                    textAlign: TextAlign.center,
                    style: Styles.p2(
                      color: CustomColors.grey800,
                    ),
                  ),
                ),
                Visibility(
                  visible: shipType?.shipName != null && !isError,
                  child: ShipTypeDataWidget(
                    label: 'Ship name',
                    value: shipType?.shipName ?? 'Not available',
                  ),
                ),
                Visibility(
                  visible: shipType?.shipName != null && !isError,
                  child: ShipTypeDataWidget(
                    label: 'Passenger capacity',
                    value: shipType?.shipFacts?.passengerCapacity ??
                        'Not available',
                  ),
                ),
                Visibility(
                  visible: shipType?.shipName != null && !isError,
                  child: ShipTypeDataWidget(
                    label: 'Crew',
                    value: shipType?.shipFacts?.crew ?? 'Not available',
                  ),
                ),
                Visibility(
                  visible: shipType?.shipName != null && !isError,
                  child: ShipTypeDataWidget(
                    label: 'Inaugural date',
                    value:
                        shipType?.shipFacts?.inauguralDate ?? 'Not available',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: !isLoading
                      ? ElevatedButton(
                          key: Key('button-key-${shipName.toLowerCase()}'),
                          onPressed: onTap,
                          child: Text(
                            shipType?.shipName == null && !isError
                                ? 'Fetch ${shipName.toLowerCase()}'
                                : isError
                                    ? 'Reload'
                                    : 'Refresh',
                            style: Styles.btn2(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const CircularProgressIndicator(),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: CustomColors.grey100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 0.5,
            color: CustomColors.grey300,
          )),
    );
  }
}
