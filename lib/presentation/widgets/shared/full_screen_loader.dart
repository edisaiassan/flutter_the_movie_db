import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando películas',
      'Cargando populares',
      'Cargando las mejores',
      'Cargando próximas a estrenarse',
      'Esto está tardando demasiado :/',
    ];

    return Stream.periodic(const Duration(seconds: 1), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
