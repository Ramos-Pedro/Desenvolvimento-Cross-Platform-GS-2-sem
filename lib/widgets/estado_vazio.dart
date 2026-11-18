import 'package:flutter/material.dart';

/// Mensagem exibida quando o filtro não encontra nenhum lote.
class EstadoVazio extends StatelessWidget {
  final String mensagem;
  final VoidCallback onVerTodos;

  const EstadoVazio({
    super.key,
    required this.mensagem,
    required this.onVerTodos,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const Icon(Icons.no_food, size: 56, color: Colors.grey),
          const SizedBox(height: 12),
          Text(
            mensagem,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          TextButton(
            onPressed: onVerTodos,
            child: const Text('Ver todos os lotes'),
          ),
        ],
      ),
    );
  }
}
