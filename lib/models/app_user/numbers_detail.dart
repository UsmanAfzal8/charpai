class NumberDetails {
  NumberDetails({
    required this.countryCode,
    required this.number,
    required this.completeNumber,
    required this.isoCode,
    required this.timestamp,
  });

  final String countryCode;
  final String number;
  final String completeNumber;
  final String isoCode;
  final int timestamp;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country_code': countryCode,
      'number': number,
      'complete_number': completeNumber,
      'iso_code': isoCode,
      'timestamp': timestamp,
    };
  }

  // ignore: sort_constructors_first
  factory NumberDetails.fromMap(Map<String, dynamic> map) {
    return NumberDetails(
      countryCode: map['country_code'] ?? '',
      number: map['number'] ?? '',
      completeNumber: map['complete_number'] ?? '',
      isoCode: map['iso_code'] ?? '',
      timestamp: map['timestamp']?.toInt() ?? 0,
    );
  }
}
