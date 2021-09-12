import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, output = 0;
  final TextEditingController t1 = TextEditingController(text: "0");
  final TextEditingController t2 = TextEditingController(text: "0");

  void solve(String sign) {
    num1 = int.parse(t1.text);
    num2 = int.parse(t2.text);
    if (output != 0) {
      if (sign == "+") {
        output += num2;
      } else if (sign == "Clear") {
        t1.text = "0";
        t2.text = "0";
        output = 0;
      } else if (sign == "/") {
        output = (output / num2).truncate().toInt();
      } else if (sign == "-") {
        output -= num2;
      } else if (sign == "*") {
        output *= num2;
      }
    } else {
      if (sign == "+") {
        output = num1 + num2;
      } else if (sign == "/") {
        output = (num1 / num2).truncate().toInt();
      } else if (sign == "*") {
        output = num1 * num2;
      } else if (sign == "Clear") {
        t1.text = "0";
        t2.text = "0";
        output = 0;
      } else {
        output = num1 - num2;
      }
    }
    setState(() {});
  }

  Widget ownButton({required String sign, Color abc = Colors.greenAccent}) {
    return MaterialButton(
      onPressed: () {
        solve(sign);
      },
      child: Text(sign),
      color: abc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Output : $output",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Input(
              t: t1,
              text: "Number 1",
            ),
            Input(
              t: t2,
              text: "Number 2",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ownButton(sign: "+"),
                ownButton(sign: "-"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ownButton(sign: "/"),
                ownButton(sign:"*"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ownButton(sign: "Clear", abc: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  Input({required this.t, required this.text});

  final TextEditingController t;
  String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: text,
      ),
      controller: t,
    );
  }
}
