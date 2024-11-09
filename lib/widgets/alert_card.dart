import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/alert_model.dart';

class AlertCard extends StatelessWidget {
  final AlertModel alert;

  AlertCard({required this.alert});

  Color _getAlertColor(String type) {
    switch (type) {
      case 'Man-in-the-Middle':
        return Colors.orange;
      case 'DDoS Attack':
        return Colors.red;
      case 'Phishing Attempt':
        return Colors.purple;
      case 'Unauthorized Access':
        return Colors.teal;
      case 'Malware Detected':
        return Colors.indigo;
      case 'SQL Injection Attempt':
        return Colors.blue;
      case 'Brute Force Attack':
        return Colors.deepOrange;
      case 'Botnet Activity':
        return Colors.green;
      case 'Suspicious File Transfer':
        return Colors.brown;
      case 'Firewall Breach':
        return Colors.pink;
      case 'Suspicious DNS Query':
        return Colors.cyan;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('dd/MM/yyyy HH:mm', 'pt_BR').format(alert.timestamp);

    return Card(
      color: _getAlertColor(alert.type).withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.warning,
                  color: _getAlertColor(alert.type),
                  size: 30,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    alert.type,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _getAlertColor(alert.type),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              alert.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nível de Risco: ${alert.riskLevel}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Detectado em: $formattedDate',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
