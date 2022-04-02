/// shipName : "Norwegian Sky"
/// shipFacts : {"passengerCapacity":"2,004 (double occupancy)","crew":"899","inauguralDate":"1999"}

class ShipTypeModel {
  ShipTypeModel({
      String? shipName, 
      ShipFacts? shipFacts,}){
    _shipName = shipName;
    _shipFacts = shipFacts;
}

  ShipTypeModel.fromJson(dynamic json) {
    _shipName = json['shipName'];
    _shipFacts = json['shipFacts'] != null ? ShipFacts.fromJson(json['shipFacts']) : null;
  }
  String? _shipName;
  ShipFacts? _shipFacts;
ShipTypeModel copyWith({  String? shipName,
  ShipFacts? shipFacts,
}) => ShipTypeModel(  shipName: shipName ?? _shipName,
  shipFacts: shipFacts ?? _shipFacts,
);
  String? get shipName => _shipName;
  ShipFacts? get shipFacts => _shipFacts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shipName'] = _shipName;
    if (_shipFacts != null) {
      map['shipFacts'] = _shipFacts?.toJson();
    }
    return map;
  }

}

/// passengerCapacity : "2,004 (double occupancy)"
/// crew : "899"
/// inauguralDate : "1999"

class ShipFacts {
  ShipFacts({
      String? passengerCapacity, 
      String? crew, 
      String? inauguralDate,}){
    _passengerCapacity = passengerCapacity;
    _crew = crew;
    _inauguralDate = inauguralDate;
}

  ShipFacts.fromJson(dynamic json) {
    _passengerCapacity = json['passengerCapacity'];
    _crew = json['crew'];
    _inauguralDate = json['inauguralDate'];
  }
  String? _passengerCapacity;
  String? _crew;
  String? _inauguralDate;
ShipFacts copyWith({  String? passengerCapacity,
  String? crew,
  String? inauguralDate,
}) => ShipFacts(  passengerCapacity: passengerCapacity ?? _passengerCapacity,
  crew: crew ?? _crew,
  inauguralDate: inauguralDate ?? _inauguralDate,
);
  String? get passengerCapacity => _passengerCapacity;
  String? get crew => _crew;
  String? get inauguralDate => _inauguralDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['passengerCapacity'] = _passengerCapacity;
    map['crew'] = _crew;
    map['inauguralDate'] = _inauguralDate;
    return map;
  }

}