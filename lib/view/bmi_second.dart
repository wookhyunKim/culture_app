
import 'package:culture_app/model/message.dart';
import 'package:flutter/material.dart';

class SecondBMI extends StatefulWidget {
  const SecondBMI({super.key});

  @override
  State<SecondBMI> createState() => _SecondBMIState();
}

class _SecondBMIState extends State<SecondBMI> {
  late bool switchValue;
  late Color buttonColor;
  late Color buttonColor1;

  @override
  void initState() {
    super.initState();
    switchValue = false;
    buttonColor = Colors.black;
    buttonColor1 = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your BMI",
                      style: TextStyle(
                        color: buttonColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${Message.message}",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Message.result,
                      style: const TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "To become a ",
                        style: TextStyle(
                          color: buttonColor,
                        ),
                      ),
                      const Text(
                        "Healthy ",
                        style: TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "you need to",
                        style: TextStyle(
                          color: buttonColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "control your weight by ${Message.minweight} kg to ${Message.maxweight} kg.",
                        style: TextStyle(
                          color: buttonColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        move1st(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // 버튼 배경색
                        foregroundColor: Colors.white, // 버튼 글씨색
                        minimumSize: const Size(100, 35),
                        shape: RoundedRectangleBorder(
                          //  버튼 모양 깎기
                          borderRadius: BorderRadius.circular(10), // 10은 파라미터
                        ),
                      ),
                      child: const Text(
                        "확인",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Less than 18.5",
                              style: TextStyle(
                                color: buttonColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "18.5 to 24.9",
                              style: TextStyle(
                                color: buttonColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "25 to 29.9",
                              style: TextStyle(
                                color: buttonColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "30 or above",
                              style: TextStyle(
                                color: buttonColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Underweight",
                              style: TextStyle(
                                color: buttonColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Healthy",
                              style: TextStyle(
                                color: buttonColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Overweight",
                              style: TextStyle(
                                color: buttonColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Obese",
                              style: TextStyle(
                                color: buttonColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// function

// 스위치로 배경색변경
  changeButtonColor() {
    if (switchValue == true) {
      buttonColor = Colors.white;
      buttonColor1 = Colors.black;
    } else {
      buttonColor = Colors.black;
      buttonColor1 = Colors.white;
    }
    setState(() {});
  }





// function
  move1st(BuildContext context){
    Navigator.pop(context);  // 메모리에서 secondpage 지우기 
  }
















} // end