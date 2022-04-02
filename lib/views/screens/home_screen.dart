import 'package:flutter/material.dart';
import 'package:norwegian_cruise_lines/controllers/ship_controller.dart';
import 'package:norwegian_cruise_lines/models/ship_type_model.dart';
import 'package:norwegian_cruise_lines/views/widgets/ship_type_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // the list of cruise to be fetched
  final List<String> _shipTypes = ['SKY', 'BLISS', 'ESCAPE'];
  // this holds each of the ship types data
  final List<ShipTypeModel> _shipTypeModels = [];
  // this keeps track of each button state
  final List<bool> _isLoading = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Norwegian Cruise Lines'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _shipTypes.asMap().entries.map((e) {
            var index = e.key;
            var shipType = e.value;

            // add each ShipTypeModel to _shipTypeModels on load
            _shipTypeModels.add(ShipTypeModel());

            // this keeps track of the loading state of each card
            _isLoading.add(false);
            return ShipTypeCardWidget(
              shipName: shipType,
              isLoading: _isLoading[index],
              shipType: _shipTypeModels[index],
              onTap: () async {
                setState(() {
                  // set the loading state to true to hide the button
                  // and show the CircularProgressBar
                  _isLoading[index] = true;
                });
                // call the api to fetch each ship data
                final shipModel =
                    await ShipController().getShipData(_shipTypes[index]);

                setState(() {
                  // set the fetched data to the shipModel
                  _shipTypeModels[index] = shipModel;

                  // set the loading to false to show the button and
                  // hide the CircularProgressBar
                  _isLoading[index] = false;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
