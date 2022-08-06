class Filter {
  Filter({
    this.distance,
    this.latitude,
    this.longitude,
    this.searchValue,
    this.isFree,
  });

  Filter.fromJson(dynamic json) {
    distance = json['distance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    searchValue = json['search_value'];
    isFree = json['is_free'];
  }
  dynamic distance;
  dynamic latitude;
  dynamic longitude;
  dynamic searchValue;
  dynamic isFree;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['distance'] = distance;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['search_value'] = searchValue;
    map['is_free'] = isFree;
    return map;
  }
}
