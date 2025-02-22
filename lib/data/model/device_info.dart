class DeviceInfoModel {
  final String id,
      type,
      model,
      brand,
      version,
      hardware,
      sdkVersion,
      manufacturer;

  DeviceInfoModel({
    required this.id,
    required this.type,
    required this.brand,
    required this.model,
    required this.version,
    required this.hardware,
    required this.sdkVersion,
    required this.manufacturer,
  });
  @override
  String toString() =>
      "id: $id\n type: $type\n model: $model\n brand: $brand\n version: $version\n hardware: $hardware\n sdkVersion: $sdkVersion\n manufacturer: $manufacturer";
}
