import 'package:culture_app/model/message.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "당신의 체력등급은 ?",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${Message.rank}",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
                Text(
                  "등급",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 300,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("당신은 체력등급은",),
                Text("상위 6.23% 입니다.")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
