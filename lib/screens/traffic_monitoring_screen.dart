import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/alert_model.dart';
import '../widgets/alert_card.dart';

class TrafficMonitoringScreen extends StatefulWidget {
  const TrafficMonitoringScreen({super.key});

  @override
  _TrafficMonitoringScreenState createState() =>
      _TrafficMonitoringScreenState();
}

class _TrafficMonitoringScreenState extends State<TrafficMonitoringScreen> {
  List<AlertModel> mockAlerts = [];
  Timer? _newAlertTimer;
  bool isAnalyzing = false;

  final Map<String, List<String>> alertMessages = {
    'Man-in-the-Middle': [
      'Interceptação suspeita detectada entre cliente e servidor.',
      'Possível ataque intermediário identificado.',
      'Atividade de interceptação na rede.'
    ],
    'DDoS Attack': [
      'Grande volume de tráfego anômalo detectado.',
      'Tráfego intenso sobrecarregando a rede.',
      'Possível ataque de negação de serviço.'
    ],
    'Phishing Attempt': [
      'URL suspeita detectada em comunicação.',
      'Tentativa de phishing identificada.',
      'Mensagem com link suspeito interceptada.'
    ],
    'Unauthorized Access': [
      'Tentativa de acesso não autorizado ao sistema.',
      'Usuário sem permissão tentou acessar o sistema.',
      'Tentativa de login não autorizada.'
    ],
    'Malware Detected': [
      'Malware detectado em tráfego de rede.',
      'Código malicioso identificado em pacote de dados.',
      'Atividade de malware detectada.'
    ],
    'SQL Injection Attempt': [
      'Tentativa de injeção de SQL detectada.',
      'Ataque de injeção SQL interceptado.',
      'Comando SQL malicioso identificado.'
    ],
    'Brute Force Attack': [
      'Múltiplas tentativas de login detectadas.',
      'Ataque de força bruta identificado.',
      'Tentativas de login excessivas.'
    ],
    'Botnet Activity': [
      'Atividade de botnet detectada na rede.',
      'Comportamento de botnet identificado.',
      'Tráfego de botnet interceptado.'
    ],
    'Suspicious File Transfer': [
      'Transferência de arquivo suspeita detectada.',
      'Arquivo malicioso identificado em tráfego.',
      'Atividade de transferência de arquivo suspeita.'
    ],
    'Firewall Breach': [
      'Possível violação de firewall detectada.',
      'Regra de firewall violada.',
      'Atividade suspeita contornando o firewall.'
    ],
    'Suspicious DNS Query': [
      'Consulta de DNS suspeita interceptada.',
      'Atividade de DNS maliciosa detectada.',
      'Possível ataque de envenenamento de cache DNS.'
    ],
  };

  @override
  void initState() {
    super.initState();
    _generateInitialAlerts();
    _newAlertTimer = Timer.periodic(const Duration(seconds: 7), (timer) {
      _addNewAlert();
    });
  }

  @override
  void dispose() {
    _newAlertTimer?.cancel();
    super.dispose();
  }

  void _generateInitialAlerts() {
    mockAlerts = [
      AlertModel(
        id: 1,
        type: 'Man-in-the-Middle',
        description:
            'Interceptação suspeita detectada entre cliente e servidor.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        riskLevel: 'Médio',
      ),
      AlertModel(
        id: 2,
        type: 'DDoS Attack',
        description: 'Grande volume de tráfego anômalo detectado.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
        riskLevel: 'Alto',
      ),
      AlertModel(
        id: 3,
        type: 'Phishing Attempt',
        description: 'URL suspeita detectada em comunicação.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        riskLevel: 'Médio',
      ),
      AlertModel(
        id: 4,
        type: 'Unauthorized Access',
        description: 'Tentativa de acesso não autorizado ao sistema.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
        riskLevel: 'Alto',
      ),
      AlertModel(
        id: 5,
        type: 'Malware Detected',
        description: 'Malware detectado em tráfego de rede.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 60)),
        riskLevel: 'Alto',
      ),
    ];
  }

  void _addNewAlert() {
    setState(() {
      isAnalyzing = true;
      final newAlertType = _getRandomAlertType();
      final newAlertMessage = _getRandomMessageForType(newAlertType);

      final newAlert = AlertModel(
        id: mockAlerts.length + 1,
        type: newAlertType,
        description: newAlertMessage,
        timestamp: DateTime.now(),
        riskLevel: 'Analisando...',
      );
      mockAlerts.insert(0, newAlert);

      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          newAlert.riskLevel = _generateRiskLevel();
          isAnalyzing = false;
        });
      });
    });
  }

  String _getRandomAlertType() {
    final alertTypes = alertMessages.keys.toList();
    return alertTypes[Random().nextInt(alertTypes.length)];
  }

  String _getRandomMessageForType(String type) {
    final messages = alertMessages[type] ?? ['Atividade suspeita detectada.'];
    return messages[Random().nextInt(messages.length)];
  }

  String _generateRiskLevel() {
    final riskLevels = ['Baixo', 'Médio', 'Alto'];
    return riskLevels[Random().nextInt(riskLevels.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.indigo[100],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.network_check,
                  color: Colors.indigo,
                  size: 40,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Atividade de Rede em Tempo Real',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Card(
              color: Colors.blue[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Icon(Icons.android, color: Colors.blue, size: 30),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        isAnalyzing
                            ? 'DeepGuard está analisando o nível de risco...'
                            : 'Monitoramento contínuo ativo.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: mockAlerts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: AlertCard(alert: mockAlerts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
