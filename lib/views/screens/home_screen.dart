import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:norwegian_cruise_lines/models/ship/ship_change_notifier.dart';
import 'package:norwegian_cruise_lines/models/ship/ship_type_model.dart';
import 'package:norwegian_cruise_lines/views/widgets/ship_type_card_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // this will watch for changes in the shipChangeNotifier Provider
    final shipNotifier = ref.watch(shipChangeNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Norwegian Cruise Lines'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: shipNotifier.shipTypes.asMap().entries.map((e) {
            var index = e.key;
            var shipType = e.value;

            // add each ShipTypeModel to _shipTypeModels on load
            shipNotifier.setShipType(shipType: ShipTypeModel());

            // this keeps track of the loading state of each card
            shipNotifier.setLoading(value: false);

            // this keeps track of the error state of each card
            shipNotifier.setError(value: false);

            return ShipTypeCardWidget(
              shipName: shipType,
              isLoading: shipNotifier.loadings[index],
              isError: shipNotifier.errors[index],
              shipType: shipNotifier.shipTypeModels[index],
              onTap: () async {
                // set the loading state to true to hide the button
                // and show the CircularProgressBar
                shipNotifier.setLoading(value: true, index: index);

                // hide the error message
                shipNotifier.setError(value: false, index: index);

                // call the api to fetch each ship data
                shipNotifier.fetchShipData(index: index);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
