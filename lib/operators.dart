import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operators_class/model/arithmetic.dart';

class OperatorView extends StatefulWidget {
  const OperatorView({super.key});

  @override
  State<OperatorView> createState() => _OperatorViewState();
}

class _OperatorViewState extends State<OperatorView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController myController = TextEditingController();
  TextEditingController myController1 = TextEditingController();
  int output = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic Operators'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'please enter first no';
                  }
                  return null;
                },
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                  hintText: 'Enter first number',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'please enter second no';
                  }
                  return null;
                },
                controller: myController1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                  hintText: 'Enter second number',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Arithmetic add = Arithmetic(
                        int.parse(myController.text),
                        int.parse(myController1.text),
                      );
                      setState(() {
                        output = add.add();
                        Navigator.pushNamed(context, '/outputs',
                            arguments: output);
                      });
                    }
                  },
                  child: const Text('Add'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Arithmetic subtract = Arithmetic(
                        int.parse(myController.text),
                        int.parse(myController1.text),
                      );
                      setState(() {
                        output = subtract.subtract();
                        Navigator.pushNamed(context, '/outputs',
                            arguments: output);
                      });
                    }
                  },
                  child: const Text('Subtract'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
