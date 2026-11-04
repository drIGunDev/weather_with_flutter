import '../../../tools/id_generator.dart';
import '../../../tools/wrapped.dart';

typedef LocationId = String;

abstract interface class GeoLocatable {
  Location get location;
}

final class Location({
  LocationId? id,
  required final double latitude,
  required final double longitude,
  required final String name,
  required final String country,
  required final String countryCode,
  required final String city,
  required final String timezone,
  final bool isActive = false,
  final DateTime? weatherUpdatedAt,

  /// Offset of the location's local time from UTC, as reported by the forecast API.
  /// Not part of equality: it is derived metadata, unknown until the first forecast fetch.
  final int? utcOffsetSeconds,
}) {
  final LocationId id;

  this : id = id ?? const UuidIdGenerator().generate();

  static const Location? empty = null;

  factory Location.short({
    required double latitude,
    required double longitude,
    required String name,
    int revisionId = 0,
    bool isActive = false,
    DateTime? weatherUpdatedAt,
  }) {
    return Location(
      id: null,
      latitude: latitude,
      longitude: longitude,
      name: name,
      country: '',
      countryCode: '',
      city: '',
      timezone: '',
      isActive: isActive,
      weatherUpdatedAt: weatherUpdatedAt,
    );
  }

  Location copyWith({
    Wrapped<DateTime?>? weatherUpdatedAt,
    bool? isActive,
    int? utcOffsetSeconds,
  }) {
    return Location(
      id: id,
      latitude: latitude,
      longitude: longitude,
      name: name,
      country: country,
      countryCode: countryCode,
      city: city,
      timezone: timezone,
      isActive: isActive ?? this.isActive,
      weatherUpdatedAt: weatherUpdatedAt?.value ?? this.weatherUpdatedAt,
      utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
    );
  }

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('Location(id: $id, ')
      ..write('latitude: $latitude, ')
      ..write('longitude: $longitude, ')
      ..write('name: $name, ')
      ..write('country: $country, ')
      ..write('countryCode: $countryCode, ')
      ..write('city: $city, ')
      ..write('timezone: $timezone, ')
      ..write('isActive: $isActive, ')
      ..write('weatherUpdatedAt: $weatherUpdatedAt, ')
      ..write('utcOffsetSeconds: $utcOffsetSeconds)');
    return buffer.toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          id == other.id &&
          name == other.name &&
          country == other.country &&
          countryCode == other.countryCode &&
          city == other.city &&
          weatherUpdatedAt == other.weatherUpdatedAt &&
          timezone == other.timezone;

  @override
  int get hashCode =>
      id.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      name.hashCode ^
      country.hashCode ^
      countryCode.hashCode ^
      city.hashCode ^
      timezone.hashCode ^
      weatherUpdatedAt.hashCode;
}
