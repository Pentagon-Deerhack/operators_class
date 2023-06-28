import 'package:flutter/material.dart';

class OutputView extends StatefulWidget {
  const OutputView({super.key});

  @override
  State<OutputView> createState() => _OutputViewState();
}

class _OutputViewState extends State<OutputView> {
  int? outputs;

  @override
  void didChangeDependencies() {
    outputs = ModalRoute.of(context)!.settings.arguments as int?;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Output'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Output:  ${outputs.toString()}',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
