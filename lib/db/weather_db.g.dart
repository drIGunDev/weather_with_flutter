// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_db.dart';

// ignore_for_file: type=lint
class $LocationTableTable extends LocationTable with TableInfo<$LocationTableTable, LocationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryCodeMeta = const VerificationMeta(
    'countryCode',
  );
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
    'country_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _weatherUpdatedAtMeta = const VerificationMeta(
    'weatherUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> weatherUpdatedAt = GeneratedColumn<DateTime>(
    'weather_updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: const Constant(null),
  );
  static const VerificationMeta _utcOffsetSecondsMeta = const VerificationMeta(
    'utcOffsetSeconds',
  );
  @override
  late final GeneratedColumn<int> utcOffsetSeconds = GeneratedColumn<int>(
    'utc_offset_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    latitude,
    longitude,
    country,
    countryCode,
    city,
    timezone,
    isActive,
    weatherUpdatedAt,
    utcOffsetSeconds,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('country_code')) {
      context.handle(
        _countryCodeMeta,
        countryCode.isAcceptableOrUnknown(
          data['country_code']!,
          _countryCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_countryCodeMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('weather_updated_at')) {
      context.handle(
        _weatherUpdatedAtMeta,
        weatherUpdatedAt.isAcceptableOrUnknown(
          data['weather_updated_at']!,
          _weatherUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('utc_offset_seconds')) {
      context.handle(
        _utcOffsetSecondsMeta,
        utcOffsetSeconds.isAcceptableOrUnknown(
          data['utc_offset_seconds']!,
          _utcOffsetSecondsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      )!,
      countryCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_code'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      )!,
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      weatherUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}weather_updated_at'],
      ),
      utcOffsetSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}utc_offset_seconds'],
      ),
    );
  }

  @override
  $LocationTableTable createAlias(String alias) {
    return $LocationTableTable(attachedDatabase, alias);
  }
}

class LocationTableData extends DataClass implements Insertable<LocationTableData> {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final String country;
  final String countryCode;
  final String city;
  final String timezone;
  final bool isActive;
  final DateTime? weatherUpdatedAt;
  final int? utcOffsetSeconds;
  const LocationTableData({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.countryCode,
    required this.city,
    required this.timezone,
    required this.isActive,
    this.weatherUpdatedAt,
    this.utcOffsetSeconds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['country'] = Variable<String>(country);
    map['country_code'] = Variable<String>(countryCode);
    map['city'] = Variable<String>(city);
    map['timezone'] = Variable<String>(timezone);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || weatherUpdatedAt != null) {
      map['weather_updated_at'] = Variable<DateTime>(weatherUpdatedAt);
    }
    if (!nullToAbsent || utcOffsetSeconds != null) {
      map['utc_offset_seconds'] = Variable<int>(utcOffsetSeconds);
    }
    return map;
  }

  LocationTableCompanion toCompanion(bool nullToAbsent) {
    return LocationTableCompanion(
      id: Value(id),
      name: Value(name),
      latitude: Value(latitude),
      longitude: Value(longitude),
      country: Value(country),
      countryCode: Value(countryCode),
      city: Value(city),
      timezone: Value(timezone),
      isActive: Value(isActive),
      weatherUpdatedAt: weatherUpdatedAt == null && nullToAbsent ? const Value.absent() : Value(weatherUpdatedAt),
      utcOffsetSeconds: utcOffsetSeconds == null && nullToAbsent ? const Value.absent() : Value(utcOffsetSeconds),
    );
  }

  factory LocationTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      country: serializer.fromJson<String>(json['country']),
      countryCode: serializer.fromJson<String>(json['countryCode']),
      city: serializer.fromJson<String>(json['city']),
      timezone: serializer.fromJson<String>(json['timezone']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      weatherUpdatedAt: serializer.fromJson<DateTime?>(
        json['weatherUpdatedAt'],
      ),
      utcOffsetSeconds: serializer.fromJson<int?>(json['utcOffsetSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'country': serializer.toJson<String>(country),
      'countryCode': serializer.toJson<String>(countryCode),
      'city': serializer.toJson<String>(city),
      'timezone': serializer.toJson<String>(timezone),
      'isActive': serializer.toJson<bool>(isActive),
      'weatherUpdatedAt': serializer.toJson<DateTime?>(weatherUpdatedAt),
      'utcOffsetSeconds': serializer.toJson<int?>(utcOffsetSeconds),
    };
  }

  LocationTableData copyWith({
    String? id,
    String? name,
    double? latitude,
    double? longitude,
    String? country,
    String? countryCode,
    String? city,
    String? timezone,
    bool? isActive,
    Value<DateTime?> weatherUpdatedAt = const Value.absent(),
    Value<int?> utcOffsetSeconds = const Value.absent(),
  }) => LocationTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    country: country ?? this.country,
    countryCode: countryCode ?? this.countryCode,
    city: city ?? this.city,
    timezone: timezone ?? this.timezone,
    isActive: isActive ?? this.isActive,
    weatherUpdatedAt: weatherUpdatedAt.present ? weatherUpdatedAt.value : this.weatherUpdatedAt,
    utcOffsetSeconds: utcOffsetSeconds.present ? utcOffsetSeconds.value : this.utcOffsetSeconds,
  );
  LocationTableData copyWithCompanion(LocationTableCompanion data) {
    return LocationTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      country: data.country.present ? data.country.value : this.country,
      countryCode: data.countryCode.present ? data.countryCode.value : this.countryCode,
      city: data.city.present ? data.city.value : this.city,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      weatherUpdatedAt: data.weatherUpdatedAt.present ? data.weatherUpdatedAt.value : this.weatherUpdatedAt,
      utcOffsetSeconds: data.utcOffsetSeconds.present ? data.utcOffsetSeconds.value : this.utcOffsetSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('country: $country, ')
          ..write('countryCode: $countryCode, ')
          ..write('city: $city, ')
          ..write('timezone: $timezone, ')
          ..write('isActive: $isActive, ')
          ..write('weatherUpdatedAt: $weatherUpdatedAt, ')
          ..write('utcOffsetSeconds: $utcOffsetSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    latitude,
    longitude,
    country,
    countryCode,
    city,
    timezone,
    isActive,
    weatherUpdatedAt,
    utcOffsetSeconds,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.country == this.country &&
          other.countryCode == this.countryCode &&
          other.city == this.city &&
          other.timezone == this.timezone &&
          other.isActive == this.isActive &&
          other.weatherUpdatedAt == this.weatherUpdatedAt &&
          other.utcOffsetSeconds == this.utcOffsetSeconds);
}

class LocationTableCompanion extends UpdateCompanion<LocationTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> country;
  final Value<String> countryCode;
  final Value<String> city;
  final Value<String> timezone;
  final Value<bool> isActive;
  final Value<DateTime?> weatherUpdatedAt;
  final Value<int?> utcOffsetSeconds;
  final Value<int> rowid;
  const LocationTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.country = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.city = const Value.absent(),
    this.timezone = const Value.absent(),
    this.isActive = const Value.absent(),
    this.weatherUpdatedAt = const Value.absent(),
    this.utcOffsetSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocationTableCompanion.insert({
    required String id,
    required String name,
    required double latitude,
    required double longitude,
    required String country,
    required String countryCode,
    required String city,
    required String timezone,
    this.isActive = const Value.absent(),
    this.weatherUpdatedAt = const Value.absent(),
    this.utcOffsetSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       latitude = Value(latitude),
       longitude = Value(longitude),
       country = Value(country),
       countryCode = Value(countryCode),
       city = Value(city),
       timezone = Value(timezone);
  static Insertable<LocationTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? country,
    Expression<String>? countryCode,
    Expression<String>? city,
    Expression<String>? timezone,
    Expression<bool>? isActive,
    Expression<DateTime>? weatherUpdatedAt,
    Expression<int>? utcOffsetSeconds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (country != null) 'country': country,
      if (countryCode != null) 'country_code': countryCode,
      if (city != null) 'city': city,
      if (timezone != null) 'timezone': timezone,
      if (isActive != null) 'is_active': isActive,
      if (weatherUpdatedAt != null) 'weather_updated_at': weatherUpdatedAt,
      if (utcOffsetSeconds != null) 'utc_offset_seconds': utcOffsetSeconds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocationTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String>? country,
    Value<String>? countryCode,
    Value<String>? city,
    Value<String>? timezone,
    Value<bool>? isActive,
    Value<DateTime?>? weatherUpdatedAt,
    Value<int?>? utcOffsetSeconds,
    Value<int>? rowid,
  }) {
    return LocationTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      city: city ?? this.city,
      timezone: timezone ?? this.timezone,
      isActive: isActive ?? this.isActive,
      weatherUpdatedAt: weatherUpdatedAt ?? this.weatherUpdatedAt,
      utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (weatherUpdatedAt.present) {
      map['weather_updated_at'] = Variable<DateTime>(weatherUpdatedAt.value);
    }
    if (utcOffsetSeconds.present) {
      map['utc_offset_seconds'] = Variable<int>(utcOffsetSeconds.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('country: $country, ')
          ..write('countryCode: $countryCode, ')
          ..write('city: $city, ')
          ..write('timezone: $timezone, ')
          ..write('isActive: $isActive, ')
          ..write('weatherUpdatedAt: $weatherUpdatedAt, ')
          ..write('utcOffsetSeconds: $utcOffsetSeconds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeatherTableTable extends WeatherTable with TableInfo<$WeatherTableTable, WeatherTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
    'start',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<DateTime> end = GeneratedColumn<DateTime>(
    'end',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _temperatureMeta = const VerificationMeta(
    'temperature',
  );
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
    'temperature',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _apparentTemperatureMeta = const VerificationMeta('apparentTemperature');
  @override
  late final GeneratedColumn<double> apparentTemperature = GeneratedColumn<double>(
    'apparent_temperature',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _windForceMeta = const VerificationMeta(
    'windForce',
  );
  @override
  late final GeneratedColumn<double> windForce = GeneratedColumn<double>(
    'wind_force',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _windGustsMeta = const VerificationMeta(
    'windGusts',
  );
  @override
  late final GeneratedColumn<double> windGusts = GeneratedColumn<double>(
    'wind_gusts',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _windDirectionGradMeta = const VerificationMeta(
    'windDirectionGrad',
  );
  @override
  late final GeneratedColumn<double> windDirectionGrad = GeneratedColumn<double>(
    'wind_direction_grad',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precipitationPercentMeta = const VerificationMeta('precipitationPercent');
  @override
  late final GeneratedColumn<double> precipitationPercent = GeneratedColumn<double>(
    'precipitation_percent',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precipitationAmountMmMeta = const VerificationMeta('precipitationAmountMm');
  @override
  late final GeneratedColumn<double> precipitationAmountMm = GeneratedColumn<double>(
    'precipitation_amount_mm',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rainMeta = const VerificationMeta('rain');
  @override
  late final GeneratedColumn<double> rain = GeneratedColumn<double>(
    'rain',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationIdMeta = const VerificationMeta(
    'locationId',
  );
  @override
  late final GeneratedColumn<String> locationId = GeneratedColumn<String>(
    'location_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES location_table (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    start,
    end,
    type,
    temperature,
    apparentTemperature,
    windForce,
    windGusts,
    windDirectionGrad,
    precipitationPercent,
    precipitationAmountMm,
    rain,
    locationId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weather_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeatherTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
        _startMeta,
        start.isAcceptableOrUnknown(data['start']!, _startMeta),
      );
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
        _endMeta,
        end.isAcceptableOrUnknown(data['end']!, _endMeta),
      );
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('temperature')) {
      context.handle(
        _temperatureMeta,
        temperature.isAcceptableOrUnknown(
          data['temperature']!,
          _temperatureMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_temperatureMeta);
    }
    if (data.containsKey('apparent_temperature')) {
      context.handle(
        _apparentTemperatureMeta,
        apparentTemperature.isAcceptableOrUnknown(
          data['apparent_temperature']!,
          _apparentTemperatureMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_apparentTemperatureMeta);
    }
    if (data.containsKey('wind_force')) {
      context.handle(
        _windForceMeta,
        windForce.isAcceptableOrUnknown(data['wind_force']!, _windForceMeta),
      );
    } else if (isInserting) {
      context.missing(_windForceMeta);
    }
    if (data.containsKey('wind_gusts')) {
      context.handle(
        _windGustsMeta,
        windGusts.isAcceptableOrUnknown(data['wind_gusts']!, _windGustsMeta),
      );
    } else if (isInserting) {
      context.missing(_windGustsMeta);
    }
    if (data.containsKey('wind_direction_grad')) {
      context.handle(
        _windDirectionGradMeta,
        windDirectionGrad.isAcceptableOrUnknown(
          data['wind_direction_grad']!,
          _windDirectionGradMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_windDirectionGradMeta);
    }
    if (data.containsKey('precipitation_percent')) {
      context.handle(
        _precipitationPercentMeta,
        precipitationPercent.isAcceptableOrUnknown(
          data['precipitation_percent']!,
          _precipitationPercentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precipitationPercentMeta);
    }
    if (data.containsKey('precipitation_amount_mm')) {
      context.handle(
        _precipitationAmountMmMeta,
        precipitationAmountMm.isAcceptableOrUnknown(
          data['precipitation_amount_mm']!,
          _precipitationAmountMmMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precipitationAmountMmMeta);
    }
    if (data.containsKey('rain')) {
      context.handle(
        _rainMeta,
        rain.isAcceptableOrUnknown(data['rain']!, _rainMeta),
      );
    } else if (isInserting) {
      context.missing(_rainMeta);
    }
    if (data.containsKey('location_id')) {
      context.handle(
        _locationIdMeta,
        locationId.isAcceptableOrUnknown(data['location_id']!, _locationIdMeta),
      );
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeatherTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeatherTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      start: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start'],
      )!,
      end: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type'],
      )!,
      temperature: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}temperature'],
      )!,
      apparentTemperature: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}apparent_temperature'],
      )!,
      windForce: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wind_force'],
      )!,
      windGusts: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wind_gusts'],
      )!,
      windDirectionGrad: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wind_direction_grad'],
      )!,
      precipitationPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precipitation_percent'],
      )!,
      precipitationAmountMm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precipitation_amount_mm'],
      )!,
      rain: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rain'],
      )!,
      locationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_id'],
      )!,
    );
  }

  @override
  $WeatherTableTable createAlias(String alias) {
    return $WeatherTableTable(attachedDatabase, alias);
  }
}

class WeatherTableData extends DataClass implements Insertable<WeatherTableData> {
  final int id;
  final DateTime start;
  final DateTime end;
  final int type;
  final double temperature;
  final double apparentTemperature;
  final double windForce;
  final double windGusts;
  final double windDirectionGrad;
  final double precipitationPercent;
  final double precipitationAmountMm;
  final double rain;
  final String locationId;
  const WeatherTableData({
    required this.id,
    required this.start,
    required this.end,
    required this.type,
    required this.temperature,
    required this.apparentTemperature,
    required this.windForce,
    required this.windGusts,
    required this.windDirectionGrad,
    required this.precipitationPercent,
    required this.precipitationAmountMm,
    required this.rain,
    required this.locationId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['start'] = Variable<DateTime>(start);
    map['end'] = Variable<DateTime>(end);
    map['type'] = Variable<int>(type);
    map['temperature'] = Variable<double>(temperature);
    map['apparent_temperature'] = Variable<double>(apparentTemperature);
    map['wind_force'] = Variable<double>(windForce);
    map['wind_gusts'] = Variable<double>(windGusts);
    map['wind_direction_grad'] = Variable<double>(windDirectionGrad);
    map['precipitation_percent'] = Variable<double>(precipitationPercent);
    map['precipitation_amount_mm'] = Variable<double>(precipitationAmountMm);
    map['rain'] = Variable<double>(rain);
    map['location_id'] = Variable<String>(locationId);
    return map;
  }

  WeatherTableCompanion toCompanion(bool nullToAbsent) {
    return WeatherTableCompanion(
      id: Value(id),
      start: Value(start),
      end: Value(end),
      type: Value(type),
      temperature: Value(temperature),
      apparentTemperature: Value(apparentTemperature),
      windForce: Value(windForce),
      windGusts: Value(windGusts),
      windDirectionGrad: Value(windDirectionGrad),
      precipitationPercent: Value(precipitationPercent),
      precipitationAmountMm: Value(precipitationAmountMm),
      rain: Value(rain),
      locationId: Value(locationId),
    );
  }

  factory WeatherTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherTableData(
      id: serializer.fromJson<int>(json['id']),
      start: serializer.fromJson<DateTime>(json['start']),
      end: serializer.fromJson<DateTime>(json['end']),
      type: serializer.fromJson<int>(json['type']),
      temperature: serializer.fromJson<double>(json['temperature']),
      apparentTemperature: serializer.fromJson<double>(
        json['apparentTemperature'],
      ),
      windForce: serializer.fromJson<double>(json['windForce']),
      windGusts: serializer.fromJson<double>(json['windGusts']),
      windDirectionGrad: serializer.fromJson<double>(json['windDirectionGrad']),
      precipitationPercent: serializer.fromJson<double>(
        json['precipitationPercent'],
      ),
      precipitationAmountMm: serializer.fromJson<double>(
        json['precipitationAmountMm'],
      ),
      rain: serializer.fromJson<double>(json['rain']),
      locationId: serializer.fromJson<String>(json['locationId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'start': serializer.toJson<DateTime>(start),
      'end': serializer.toJson<DateTime>(end),
      'type': serializer.toJson<int>(type),
      'temperature': serializer.toJson<double>(temperature),
      'apparentTemperature': serializer.toJson<double>(apparentTemperature),
      'windForce': serializer.toJson<double>(windForce),
      'windGusts': serializer.toJson<double>(windGusts),
      'windDirectionGrad': serializer.toJson<double>(windDirectionGrad),
      'precipitationPercent': serializer.toJson<double>(precipitationPercent),
      'precipitationAmountMm': serializer.toJson<double>(precipitationAmountMm),
      'rain': serializer.toJson<double>(rain),
      'locationId': serializer.toJson<String>(locationId),
    };
  }

  WeatherTableData copyWith({
    int? id,
    DateTime? start,
    DateTime? end,
    int? type,
    double? temperature,
    double? apparentTemperature,
    double? windForce,
    double? windGusts,
    double? windDirectionGrad,
    double? precipitationPercent,
    double? precipitationAmountMm,
    double? rain,
    String? locationId,
  }) => WeatherTableData(
    id: id ?? this.id,
    start: start ?? this.start,
    end: end ?? this.end,
    type: type ?? this.type,
    temperature: temperature ?? this.temperature,
    apparentTemperature: apparentTemperature ?? this.apparentTemperature,
    windForce: windForce ?? this.windForce,
    windGusts: windGusts ?? this.windGusts,
    windDirectionGrad: windDirectionGrad ?? this.windDirectionGrad,
    precipitationPercent: precipitationPercent ?? this.precipitationPercent,
    precipitationAmountMm: precipitationAmountMm ?? this.precipitationAmountMm,
    rain: rain ?? this.rain,
    locationId: locationId ?? this.locationId,
  );
  WeatherTableData copyWithCompanion(WeatherTableCompanion data) {
    return WeatherTableData(
      id: data.id.present ? data.id.value : this.id,
      start: data.start.present ? data.start.value : this.start,
      end: data.end.present ? data.end.value : this.end,
      type: data.type.present ? data.type.value : this.type,
      temperature: data.temperature.present ? data.temperature.value : this.temperature,
      apparentTemperature: data.apparentTemperature.present ? data.apparentTemperature.value : this.apparentTemperature,
      windForce: data.windForce.present ? data.windForce.value : this.windForce,
      windGusts: data.windGusts.present ? data.windGusts.value : this.windGusts,
      windDirectionGrad: data.windDirectionGrad.present ? data.windDirectionGrad.value : this.windDirectionGrad,
      precipitationPercent: data.precipitationPercent.present ? data.precipitationPercent.value : this.precipitationPercent,
      precipitationAmountMm: data.precipitationAmountMm.present ? data.precipitationAmountMm.value : this.precipitationAmountMm,
      rain: data.rain.present ? data.rain.value : this.rain,
      locationId: data.locationId.present ? data.locationId.value : this.locationId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeatherTableData(')
          ..write('id: $id, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('type: $type, ')
          ..write('temperature: $temperature, ')
          ..write('apparentTemperature: $apparentTemperature, ')
          ..write('windForce: $windForce, ')
          ..write('windGusts: $windGusts, ')
          ..write('windDirectionGrad: $windDirectionGrad, ')
          ..write('precipitationPercent: $precipitationPercent, ')
          ..write('precipitationAmountMm: $precipitationAmountMm, ')
          ..write('rain: $rain, ')
          ..write('locationId: $locationId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    start,
    end,
    type,
    temperature,
    apparentTemperature,
    windForce,
    windGusts,
    windDirectionGrad,
    precipitationPercent,
    precipitationAmountMm,
    rain,
    locationId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherTableData &&
          other.id == this.id &&
          other.start == this.start &&
          other.end == this.end &&
          other.type == this.type &&
          other.temperature == this.temperature &&
          other.apparentTemperature == this.apparentTemperature &&
          other.windForce == this.windForce &&
          other.windGusts == this.windGusts &&
          other.windDirectionGrad == this.windDirectionGrad &&
          other.precipitationPercent == this.precipitationPercent &&
          other.precipitationAmountMm == this.precipitationAmountMm &&
          other.rain == this.rain &&
          other.locationId == this.locationId);
}

class WeatherTableCompanion extends UpdateCompanion<WeatherTableData> {
  final Value<int> id;
  final Value<DateTime> start;
  final Value<DateTime> end;
  final Value<int> type;
  final Value<double> temperature;
  final Value<double> apparentTemperature;
  final Value<double> windForce;
  final Value<double> windGusts;
  final Value<double> windDirectionGrad;
  final Value<double> precipitationPercent;
  final Value<double> precipitationAmountMm;
  final Value<double> rain;
  final Value<String> locationId;
  const WeatherTableCompanion({
    this.id = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.type = const Value.absent(),
    this.temperature = const Value.absent(),
    this.apparentTemperature = const Value.absent(),
    this.windForce = const Value.absent(),
    this.windGusts = const Value.absent(),
    this.windDirectionGrad = const Value.absent(),
    this.precipitationPercent = const Value.absent(),
    this.precipitationAmountMm = const Value.absent(),
    this.rain = const Value.absent(),
    this.locationId = const Value.absent(),
  });
  WeatherTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime start,
    required DateTime end,
    required int type,
    required double temperature,
    required double apparentTemperature,
    required double windForce,
    required double windGusts,
    required double windDirectionGrad,
    required double precipitationPercent,
    required double precipitationAmountMm,
    required double rain,
    required String locationId,
  }) : start = Value(start),
       end = Value(end),
       type = Value(type),
       temperature = Value(temperature),
       apparentTemperature = Value(apparentTemperature),
       windForce = Value(windForce),
       windGusts = Value(windGusts),
       windDirectionGrad = Value(windDirectionGrad),
       precipitationPercent = Value(precipitationPercent),
       precipitationAmountMm = Value(precipitationAmountMm),
       rain = Value(rain),
       locationId = Value(locationId);
  static Insertable<WeatherTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? start,
    Expression<DateTime>? end,
    Expression<int>? type,
    Expression<double>? temperature,
    Expression<double>? apparentTemperature,
    Expression<double>? windForce,
    Expression<double>? windGusts,
    Expression<double>? windDirectionGrad,
    Expression<double>? precipitationPercent,
    Expression<double>? precipitationAmountMm,
    Expression<double>? rain,
    Expression<String>? locationId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
      if (type != null) 'type': type,
      if (temperature != null) 'temperature': temperature,
      if (apparentTemperature != null) 'apparent_temperature': apparentTemperature,
      if (windForce != null) 'wind_force': windForce,
      if (windGusts != null) 'wind_gusts': windGusts,
      if (windDirectionGrad != null) 'wind_direction_grad': windDirectionGrad,
      if (precipitationPercent != null) 'precipitation_percent': precipitationPercent,
      if (precipitationAmountMm != null) 'precipitation_amount_mm': precipitationAmountMm,
      if (rain != null) 'rain': rain,
      if (locationId != null) 'location_id': locationId,
    });
  }

  WeatherTableCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? start,
    Value<DateTime>? end,
    Value<int>? type,
    Value<double>? temperature,
    Value<double>? apparentTemperature,
    Value<double>? windForce,
    Value<double>? windGusts,
    Value<double>? windDirectionGrad,
    Value<double>? precipitationPercent,
    Value<double>? precipitationAmountMm,
    Value<double>? rain,
    Value<String>? locationId,
  }) {
    return WeatherTableCompanion(
      id: id ?? this.id,
      start: start ?? this.start,
      end: end ?? this.end,
      type: type ?? this.type,
      temperature: temperature ?? this.temperature,
      apparentTemperature: apparentTemperature ?? this.apparentTemperature,
      windForce: windForce ?? this.windForce,
      windGusts: windGusts ?? this.windGusts,
      windDirectionGrad: windDirectionGrad ?? this.windDirectionGrad,
      precipitationPercent: precipitationPercent ?? this.precipitationPercent,
      precipitationAmountMm: precipitationAmountMm ?? this.precipitationAmountMm,
      rain: rain ?? this.rain,
      locationId: locationId ?? this.locationId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<DateTime>(end.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (apparentTemperature.present) {
      map['apparent_temperature'] = Variable<double>(apparentTemperature.value);
    }
    if (windForce.present) {
      map['wind_force'] = Variable<double>(windForce.value);
    }
    if (windGusts.present) {
      map['wind_gusts'] = Variable<double>(windGusts.value);
    }
    if (windDirectionGrad.present) {
      map['wind_direction_grad'] = Variable<double>(windDirectionGrad.value);
    }
    if (precipitationPercent.present) {
      map['precipitation_percent'] = Variable<double>(
        precipitationPercent.value,
      );
    }
    if (precipitationAmountMm.present) {
      map['precipitation_amount_mm'] = Variable<double>(
        precipitationAmountMm.value,
      );
    }
    if (rain.present) {
      map['rain'] = Variable<double>(rain.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<String>(locationId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherTableCompanion(')
          ..write('id: $id, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('type: $type, ')
          ..write('temperature: $temperature, ')
          ..write('apparentTemperature: $apparentTemperature, ')
          ..write('windForce: $windForce, ')
          ..write('windGusts: $windGusts, ')
          ..write('windDirectionGrad: $windDirectionGrad, ')
          ..write('precipitationPercent: $precipitationPercent, ')
          ..write('precipitationAmountMm: $precipitationAmountMm, ')
          ..write('rain: $rain, ')
          ..write('locationId: $locationId')
          ..write(')'))
        .toString();
  }
}

abstract class _$WeatherDatabase extends GeneratedDatabase {
  _$WeatherDatabase(QueryExecutor e) : super(e);
  $WeatherDatabaseManager get managers => $WeatherDatabaseManager(this);
  late final $LocationTableTable locationTable = $LocationTableTable(this);
  late final $WeatherTableTable weatherTable = $WeatherTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    locationTable,
    weatherTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'location_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('weather_table', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$LocationTableTableCreateCompanionBuilder = LocationTableCompanion Function({
  required String id,
  required String name,
  required double latitude,
  required double longitude,
  required String country,
  required String countryCode,
  required String city,
  required String timezone,
  Value<bool> isActive,
  Value<DateTime?> weatherUpdatedAt,
  Value<int?> utcOffsetSeconds,
  Value<int> rowid,
});
typedef $$LocationTableTableUpdateCompanionBuilder = LocationTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<double> latitude,
  Value<double> longitude,
  Value<String> country,
  Value<String> countryCode,
  Value<String> city,
  Value<String> timezone,
  Value<bool> isActive,
  Value<DateTime?> weatherUpdatedAt,
  Value<int?> utcOffsetSeconds,
  Value<int> rowid,
});

final class $$LocationTableTableReferences extends BaseReferences<_$WeatherDatabase, $LocationTableTable, LocationTableData> {
  $$LocationTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$WeatherTableTable, List<WeatherTableData>> _weatherTableRefsTable(_$WeatherDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.weatherTable,
        aliasName: 'location_table__id__weather_table__location_id',
      );

  $$WeatherTableTableProcessedTableManager get weatherTableRefs {
    final manager = $$WeatherTableTableTableManager(
      $_db,
      $_db.weatherTable,
    ).filter((f) => f.locationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_weatherTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LocationTableTableFilterComposer extends Composer<_$WeatherDatabase, $LocationTableTable> {
  $$LocationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get weatherUpdatedAt => $composableBuilder(
    column: $table.weatherUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get utcOffsetSeconds => $composableBuilder(
    column: $table.utcOffsetSeconds,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> weatherTableRefs(
    Expression<bool> Function($$WeatherTableTableFilterComposer f) f,
  ) {
    final $$WeatherTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weatherTable,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeatherTableTableFilterComposer(
            $db: $db,
            $table: $db.weatherTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationTableTableOrderingComposer extends Composer<_$WeatherDatabase, $LocationTableTable> {
  $$LocationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get weatherUpdatedAt => $composableBuilder(
    column: $table.weatherUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get utcOffsetSeconds => $composableBuilder(
    column: $table.utcOffsetSeconds,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocationTableTableAnnotationComposer extends Composer<_$WeatherDatabase, $LocationTableTable> {
  $$LocationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name => $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get latitude => $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude => $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get country => $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city => $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get timezone => $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<bool> get isActive => $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get weatherUpdatedAt => $composableBuilder(
    column: $table.weatherUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get utcOffsetSeconds => $composableBuilder(
    column: $table.utcOffsetSeconds,
    builder: (column) => column,
  );

  Expression<T> weatherTableRefs<T extends Object>(
    Expression<T> Function($$WeatherTableTableAnnotationComposer a) f,
  ) {
    final $$WeatherTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weatherTable,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeatherTableTableAnnotationComposer(
            $db: $db,
            $table: $db.weatherTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationTableTableTableManager
    extends
        RootTableManager<
          _$WeatherDatabase,
          $LocationTableTable,
          LocationTableData,
          $$LocationTableTableFilterComposer,
          $$LocationTableTableOrderingComposer,
          $$LocationTableTableAnnotationComposer,
          $$LocationTableTableCreateCompanionBuilder,
          $$LocationTableTableUpdateCompanionBuilder,
          (LocationTableData, $$LocationTableTableReferences),
          LocationTableData,
          PrefetchHooks Function({bool weatherTableRefs})
        > {
  $$LocationTableTableTableManager(
    _$WeatherDatabase db,
    $LocationTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$LocationTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$LocationTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$LocationTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String> country = const Value.absent(),
                Value<String> countryCode = const Value.absent(),
                Value<String> city = const Value.absent(),
                Value<String> timezone = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> weatherUpdatedAt = const Value.absent(),
                Value<int?> utcOffsetSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocationTableCompanion(
                id: id,
                name: name,
                latitude: latitude,
                longitude: longitude,
                country: country,
                countryCode: countryCode,
                city: city,
                timezone: timezone,
                isActive: isActive,
                weatherUpdatedAt: weatherUpdatedAt,
                utcOffsetSeconds: utcOffsetSeconds,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required double latitude,
                required double longitude,
                required String country,
                required String countryCode,
                required String city,
                required String timezone,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> weatherUpdatedAt = const Value.absent(),
                Value<int?> utcOffsetSeconds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocationTableCompanion.insert(
                id: id,
                name: name,
                latitude: latitude,
                longitude: longitude,
                country: country,
                countryCode: countryCode,
                city: city,
                timezone: timezone,
                isActive: isActive,
                weatherUpdatedAt: weatherUpdatedAt,
                utcOffsetSeconds: utcOffsetSeconds,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LocationTableTable, LocationTableData>(table),
                  $$LocationTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({weatherTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (weatherTableRefs) db.weatherTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (weatherTableRefs)
                    await $_getPrefetchedData<LocationTableData, $LocationTableTable, WeatherTableData>(
                      currentTable: table,
                      referencedTable: $$LocationTableTableReferences._weatherTableRefsTable(db),
                      managerFromTypedResult: (p0) => $$LocationTableTableReferences(
                        db,
                        table,
                        p0,
                      ).weatherTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) => referencedItems.where((e) => e.locationId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LocationTableTableProcessedTableManager =
    ProcessedTableManager<
      _$WeatherDatabase,
      $LocationTableTable,
      LocationTableData,
      $$LocationTableTableFilterComposer,
      $$LocationTableTableOrderingComposer,
      $$LocationTableTableAnnotationComposer,
      $$LocationTableTableCreateCompanionBuilder,
      $$LocationTableTableUpdateCompanionBuilder,
      (LocationTableData, $$LocationTableTableReferences),
      LocationTableData,
      PrefetchHooks Function({bool weatherTableRefs})
    >;
typedef $$WeatherTableTableCreateCompanionBuilder = WeatherTableCompanion Function({
  Value<int> id,
  required DateTime start,
  required DateTime end,
  required int type,
  required double temperature,
  required double apparentTemperature,
  required double windForce,
  required double windGusts,
  required double windDirectionGrad,
  required double precipitationPercent,
  required double precipitationAmountMm,
  required double rain,
  required String locationId,
});
typedef $$WeatherTableTableUpdateCompanionBuilder = WeatherTableCompanion Function({
  Value<int> id,
  Value<DateTime> start,
  Value<DateTime> end,
  Value<int> type,
  Value<double> temperature,
  Value<double> apparentTemperature,
  Value<double> windForce,
  Value<double> windGusts,
  Value<double> windDirectionGrad,
  Value<double> precipitationPercent,
  Value<double> precipitationAmountMm,
  Value<double> rain,
  Value<String> locationId,
});

final class $$WeatherTableTableReferences extends BaseReferences<_$WeatherDatabase, $WeatherTableTable, WeatherTableData> {
  $$WeatherTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LocationTableTable _locationIdTable(_$WeatherDatabase db) => db.locationTable.createAlias('weather_table__location_id__location_table__id');

  $$LocationTableTableProcessedTableManager get locationId {
    final $_column = $_itemColumn<String>('location_id')!;

    final manager = $$LocationTableTableTableManager(
      $_db,
      $_db.locationTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WeatherTableTableFilterComposer extends Composer<_$WeatherDatabase, $WeatherTableTable> {
  $$WeatherTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get end => $composableBuilder(
    column: $table.end,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get apparentTemperature => $composableBuilder(
    column: $table.apparentTemperature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get windForce => $composableBuilder(
    column: $table.windForce,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get windGusts => $composableBuilder(
    column: $table.windGusts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get windDirectionGrad => $composableBuilder(
    column: $table.windDirectionGrad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precipitationPercent => $composableBuilder(
    column: $table.precipitationPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precipitationAmountMm => $composableBuilder(
    column: $table.precipitationAmountMm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rain => $composableBuilder(
    column: $table.rain,
    builder: (column) => ColumnFilters(column),
  );

  $$LocationTableTableFilterComposer get locationId {
    final $$LocationTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locationTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableTableFilterComposer(
            $db: $db,
            $table: $db.locationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeatherTableTableOrderingComposer extends Composer<_$WeatherDatabase, $WeatherTableTable> {
  $$WeatherTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get end => $composableBuilder(
    column: $table.end,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get apparentTemperature => $composableBuilder(
    column: $table.apparentTemperature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get windForce => $composableBuilder(
    column: $table.windForce,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get windGusts => $composableBuilder(
    column: $table.windGusts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get windDirectionGrad => $composableBuilder(
    column: $table.windDirectionGrad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precipitationPercent => $composableBuilder(
    column: $table.precipitationPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precipitationAmountMm => $composableBuilder(
    column: $table.precipitationAmountMm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rain => $composableBuilder(
    column: $table.rain,
    builder: (column) => ColumnOrderings(column),
  );

  $$LocationTableTableOrderingComposer get locationId {
    final $$LocationTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locationTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableTableOrderingComposer(
            $db: $db,
            $table: $db.locationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeatherTableTableAnnotationComposer extends Composer<_$WeatherDatabase, $WeatherTableTable> {
  $$WeatherTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get start => $composableBuilder(column: $table.start, builder: (column) => column);

  GeneratedColumn<DateTime> get end => $composableBuilder(column: $table.end, builder: (column) => column);

  GeneratedColumn<int> get type => $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => column,
  );

  GeneratedColumn<double> get apparentTemperature => $composableBuilder(
    column: $table.apparentTemperature,
    builder: (column) => column,
  );

  GeneratedColumn<double> get windForce => $composableBuilder(column: $table.windForce, builder: (column) => column);

  GeneratedColumn<double> get windGusts => $composableBuilder(column: $table.windGusts, builder: (column) => column);

  GeneratedColumn<double> get windDirectionGrad => $composableBuilder(
    column: $table.windDirectionGrad,
    builder: (column) => column,
  );

  GeneratedColumn<double> get precipitationPercent => $composableBuilder(
    column: $table.precipitationPercent,
    builder: (column) => column,
  );

  GeneratedColumn<double> get precipitationAmountMm => $composableBuilder(
    column: $table.precipitationAmountMm,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rain => $composableBuilder(column: $table.rain, builder: (column) => column);

  $$LocationTableTableAnnotationComposer get locationId {
    final $$LocationTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locationTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableTableAnnotationComposer(
            $db: $db,
            $table: $db.locationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeatherTableTableTableManager
    extends
        RootTableManager<
          _$WeatherDatabase,
          $WeatherTableTable,
          WeatherTableData,
          $$WeatherTableTableFilterComposer,
          $$WeatherTableTableOrderingComposer,
          $$WeatherTableTableAnnotationComposer,
          $$WeatherTableTableCreateCompanionBuilder,
          $$WeatherTableTableUpdateCompanionBuilder,
          (WeatherTableData, $$WeatherTableTableReferences),
          WeatherTableData,
          PrefetchHooks Function({bool locationId})
        > {
  $$WeatherTableTableTableManager(
    _$WeatherDatabase db,
    $WeatherTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$WeatherTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$WeatherTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$WeatherTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> start = const Value.absent(),
                Value<DateTime> end = const Value.absent(),
                Value<int> type = const Value.absent(),
                Value<double> temperature = const Value.absent(),
                Value<double> apparentTemperature = const Value.absent(),
                Value<double> windForce = const Value.absent(),
                Value<double> windGusts = const Value.absent(),
                Value<double> windDirectionGrad = const Value.absent(),
                Value<double> precipitationPercent = const Value.absent(),
                Value<double> precipitationAmountMm = const Value.absent(),
                Value<double> rain = const Value.absent(),
                Value<String> locationId = const Value.absent(),
              }) => WeatherTableCompanion(
                id: id,
                start: start,
                end: end,
                type: type,
                temperature: temperature,
                apparentTemperature: apparentTemperature,
                windForce: windForce,
                windGusts: windGusts,
                windDirectionGrad: windDirectionGrad,
                precipitationPercent: precipitationPercent,
                precipitationAmountMm: precipitationAmountMm,
                rain: rain,
                locationId: locationId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime start,
                required DateTime end,
                required int type,
                required double temperature,
                required double apparentTemperature,
                required double windForce,
                required double windGusts,
                required double windDirectionGrad,
                required double precipitationPercent,
                required double precipitationAmountMm,
                required double rain,
                required String locationId,
              }) => WeatherTableCompanion.insert(
                id: id,
                start: start,
                end: end,
                type: type,
                temperature: temperature,
                apparentTemperature: apparentTemperature,
                windForce: windForce,
                windGusts: windGusts,
                windDirectionGrad: windDirectionGrad,
                precipitationPercent: precipitationPercent,
                precipitationAmountMm: precipitationAmountMm,
                rain: rain,
                locationId: locationId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WeatherTableTable, WeatherTableData>(table),
                  $$WeatherTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({locationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <T extends TableManagerState<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>>(
                    state,
                  ) {
                    if (locationId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.locationId,
                        referencedTable: $$WeatherTableTableReferences._locationIdTable(db),
                        referencedColumn: $$WeatherTableTableReferences._locationIdTable(db).id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WeatherTableTableProcessedTableManager =
    ProcessedTableManager<
      _$WeatherDatabase,
      $WeatherTableTable,
      WeatherTableData,
      $$WeatherTableTableFilterComposer,
      $$WeatherTableTableOrderingComposer,
      $$WeatherTableTableAnnotationComposer,
      $$WeatherTableTableCreateCompanionBuilder,
      $$WeatherTableTableUpdateCompanionBuilder,
      (WeatherTableData, $$WeatherTableTableReferences),
      WeatherTableData,
      PrefetchHooks Function({bool locationId})
    >;

class $WeatherDatabaseManager {
  final _$WeatherDatabase _db;
  $WeatherDatabaseManager(this._db);
  $$LocationTableTableTableManager get locationTable => $$LocationTableTableTableManager(_db, _db.locationTable);
  $$WeatherTableTableTableManager get weatherTable => $$WeatherTableTableTableManager(_db, _db.weatherTable);
}
