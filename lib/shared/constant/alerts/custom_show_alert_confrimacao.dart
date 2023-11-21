import 'package:flutter/material.dart';
import 'package:target_sistemas/repositories/data/service/storage_service.dart';

StorageService storage = StorageService();
Future<void> showDeleteConfirmationDialog(
    BuildContext context, int index) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Alerta"),
        content: const Text("Esta ação irá excluir o texto, deseja continuar?"),
        actions: [
          TextButton(
            onPressed: () async {
              await storage.deleteText(index);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text("Sim"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Não"),
          ),
        ],
      );
    },
  );
}
