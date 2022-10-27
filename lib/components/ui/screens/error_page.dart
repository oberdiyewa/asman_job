import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  /// Creates an [ErrorScreen].
  const ErrorScreen(this.error, {super.key});

  /// The error to display.
  final Exception error;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('My "Page Not Found" Screen')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SelectableText(error.toString()),
              TextButton(
                onPressed: () => context.go('/'),
                child: const Text('Home'),
              ),
            ],
          ),
        ),
      );
}
