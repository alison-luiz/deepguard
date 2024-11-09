class AlertModel {
  final int id;
  final String type;
  final String description;
  final DateTime timestamp;
  String riskLevel;

  AlertModel({
    required this.id,
    required this.type,
    required this.description,
    required this.timestamp,
    this.riskLevel = 'Unknown',
  });
}
