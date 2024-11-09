import 'package:flutter/material.dart';

class DetectionSettingsScreen extends StatefulWidget {
  const DetectionSettingsScreen({super.key});

  @override
  _DetectionSettingsScreenState createState() =>
      _DetectionSettingsScreenState();
}

class _DetectionSettingsScreenState extends State<DetectionSettingsScreen> {
  double sensitivity = 0.5;
  bool autoConnect = true;
  bool enableIAMonitoring = true;
  bool notificationsEnabled = true;
  bool autoUpdate = true;
  bool activityLogging = true;
  bool enhancedSecurity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cabeçalho
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
                const Icon(Icons.settings, color: Colors.indigo, size: 40),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Configurações do DeepGuard',
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
          const SizedBox(height: 16),

          // Configuração de Conexão com a Rede
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Configuração de Conexão com a Rede'),
                Row(
                  children: [
                    _buildDisabledTextField('IP do Servidor', '192.168.1.100'),
                    const SizedBox(width: 16),
                    _buildDisabledTextField('Porta de Conexão', '8080'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.circle, color: Colors.green, size: 14),
                    const SizedBox(width: 8),
                    const Text(
                      'Status: Conectado',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Configurações de Uso de IA do Monitoramento
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Configurações de Uso de IA'),
                SwitchListTile(
                  title: const Text('IA para Monitoramento em Tempo Real'),
                  value: enableIAMonitoring,
                  onChanged: (value) {
                    setState(() {
                      enableIAMonitoring = value;
                    });
                  },
                ),
                const Divider(),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Sensibilidade de Detecção com Explicação
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Sensibilidade de Detecção'),
                const Text(
                  'Ajuste a sensibilidade para definir o nível de alerta da IA. Sensibilidades mais altas '
                  'podem aumentar a detecção de atividades suspeitas, mas podem gerar mais falsos positivos.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Slider(
                  value: sensitivity,
                  min: 0,
                  max: 1,
                  divisions: 10,
                  label: sensitivity.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      sensitivity = value;
                    });
                  },
                ),
                const Divider(),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Configurações de Notificação
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Configurações de Notificação'),
                SwitchListTile(
                  title: const Text('Notificações de Alerta Ativadas'),
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),
                const Divider(),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Outras Configurações Avançadas
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Configurações Avançadas'),
                SwitchListTile(
                  title: const Text('Atualização Automática de Definições'),
                  value: autoUpdate,
                  onChanged: (value) {
                    setState(() {
                      autoUpdate = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Registro de Logs de Atividade'),
                  value: activityLogging,
                  onChanged: (value) {
                    setState(() {
                      activityLogging = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Segurança Reforçada'),
                  value: enhancedSecurity,
                  onChanged: (value) {
                    setState(() {
                      enhancedSecurity = value;
                    });
                  },
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método para criar o título das seções de configuração
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }

  // Método para criar TextFields desabilitados com informações de conexão de rede
  Widget _buildDisabledTextField(String label, String value) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        enabled: false,
        controller: TextEditingController(text: value),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
