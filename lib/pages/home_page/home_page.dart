import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoinflutter/pages/home_page/theme_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    final value = TextEditingController();

    double amount = 0.0;
    int count = 0;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: form,
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Valor da conta",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: value,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.monetization_on_outlined)),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              double doubleValue = double.parse(value);

              setState(() {
                amount = value.isEmpty
                    ? 0
                    : doubleValue * (doubleValue * (10.0 / 100.0));
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'Calcular com 10%',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              'Conta com 10%: $count',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
