import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
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
                const Icon(Icons.dashboard, color: Colors.indigo, size: 40),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Status de Segurança',
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
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildStatusCard(
                    icon: Icons.shield,
                    title: 'Status de Proteção',
                    description: 'Nenhuma ameaça detectada',
                    color: Colors.green,
                  ),
                  const SizedBox(height: 10),
                  _buildStatusCard(
                    icon: Icons.warning_amber_rounded,
                    title: 'Alertas Recentes',
                    description: '27 alertas nas últimas 24h',
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 10),
                  _buildStatusCard(
                    icon: Icons.security,
                    title: 'Firewall Ativo',
                    description: 'Proteção máxima ativada',
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 10),
                  _buildStatusCard(
                    icon: Icons.network_check,
                    title: 'Monitoramento de Rede',
                    description: 'Tráfego normal',
                    color: Colors.indigo,
                  ),
                  const SizedBox(height: 10),
                  _buildStatusCard(
                    icon: Icons.update,
                    title: 'Última Atualização',
                    description: 'Atualizado há 5 min',
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
