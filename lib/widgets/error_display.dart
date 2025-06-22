// lib/widgets/error_display.dart

import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final String message;
  final VoidCallback onRetry; // Função a ser chamada ao tentar novamente

  const ErrorDisplay({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off, color: Colors.grey, size: 80),
            const SizedBox(height: 20),
            const Text('Ops! Algo deu errado.', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              message,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.black,
              ),
              onPressed: onRetry,
              child: const Text('Tentar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}