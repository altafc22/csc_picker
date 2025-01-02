class LocationModel {
  final String? country;
  final String? state;
  final String? city;

  const LocationModel({
    this.country,
    this.state,
    this.city,
  });

  LocationModel copyWith({
    String? country,
    String? state,
    String? city,
  }) {
    return LocationModel(
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
    );
  }

  @override
  String toString() => '$city, $state, $country';
}
