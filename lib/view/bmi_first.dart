
import 'package:culture_app/model/message.dart';

import 'package:flutter/material.dart';

class FirstBMI extends StatefulWidget {
  const FirstBMI({super.key});

  @override
  State<FirstBMI> createState() => _FirstBMIState();
}

class _FirstBMIState extends State<FirstBMI> {
  // property
  late TextEditingController height;
  late TextEditingController weight;
  late double bmi;
  late bool switchValue;
  late Color buttonColor;
  late Color buttonColor1;
  late String bmiResult;
  late double low_weight;
  late double high_weight;

  @override
  void initState() {
    super.initState();
    height = TextEditingController(text: '166');
    weight = TextEditingController(text: '60');
    bmi = 0;
    switchValue = false;
    buttonColor = Colors.black;
    buttonColor1 = Colors.white;
    bmiResult = "Healthy";
    low_weight = 20;
    high_weight = 20;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BMI\n CLACULATION ",
              style: TextStyle(
                fontSize: 40,
                color: buttonColor,
              ),
              textAlign: TextAlign.center,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Row(
                      // 키
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height :",
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 70,
                          height: 35,
                          child: TextField(
                            controller: height,
                            // 일하는 것은 컨트롤러 글씨가 바뀌는 것을 탐지 setState가 없어도된다.
                            decoration: const InputDecoration(
                              labelText: "cm", // 글자없어지지 않음
                              border: OutlineInputBorder(), // 텍스트필드 테두리
                            ),
                            keyboardType: TextInputType.number, // 키보드 형태
                          ),
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () => upHeight(),
                              child: const Icon(
                                Icons.arrow_drop_up_outlined,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => downHeight(),
                              child: const Icon(
                                Icons.arrow_drop_down_outlined,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Row(
                      // 몸무게
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight :",
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () => downWeight(),
                          child: const Icon(
                            Icons.arrow_left_outlined,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          height: 35,
                          child: TextField(
                            controller: weight,
                            // 일하는 것은 컨트롤러 글씨가 바뀌는 것을 탐지 setState가 없어도된다.
                            decoration: const InputDecoration(
                              labelText: "kg", // 글자없어지지 않음
                              border: OutlineInputBorder(), // 텍스트필드 테두리
                              hintStyle: TextStyle(
                                backgroundColor: Colors.red,
                              ),
                            ),
                            keyboardType: TextInputType.number, // 키보드 형태
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => upWeight(),
                              child: const Icon(
                                Icons.arrow_right_outlined,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _showDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // 버튼 배경색
                        foregroundColor: Colors.white, // 버튼 글씨색
                        shape: RoundedRectangleBorder(
                          //  버튼 모양 깎기
                          borderRadius: BorderRadius.circular(10), // 10은 파라미터
                        ),
                      ),
                      child: const Text(
                        "Check!",
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

// -------functions

// bmi계산
  calcBMI() {
    bmi = double.parse(weight.text) /
        ((double.parse(height.text) * 0.01) *
            (double.parse(height.text) * 0.01));
  }

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

// 작성안하고 버튼누를때 alert
//----- functions----
  _showDialog(BuildContext context) {
    // _를 처음에 사용하면 private
    if (weight.text.trim().isEmpty | height.text.trim().isEmpty) {
      showDialog(
        context: context, // 복원시키기위해 context필요
        barrierDismissible: false, // alert창 외에 클릭 시 alert 닫히는 것을 막기위함
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(
              "Error",
            ),
            content: const Text(
              "키와 몸무게를 입력해 주세요.",
            ), // text 안에서 줄 바꾸기는 \n을 넣는다.
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    }, //pop은 메모리에서 지우기
                    child: const Text(
                      "뒤로",
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    } else {
      calcBMI();
      Message.message = (bmi * 100).round() / 100;
      bmiJudge();
      low();
      high();
      Navigator.pushNamed(context, "/bmi2nd");
    }
  }

  upHeight() {
    height.text = (double.parse(height.text) + 1).toString();
  }

  upWeight() {
    weight.text = (double.parse(weight.text) + 1).toString();
  }

  downHeight() {
    height.text = (double.parse(height.text) - 1).toString();
  }

  downWeight() {
    weight.text = (double.parse(weight.text) - 1).toString();
  }




  bmiJudge(){

    if(bmi<18.5){
      bmiResult = "Underweight"; 
    }else if(bmi<24.9){
      bmiResult = "Healthy";
    }else if(bmi<29.9){
      bmiResult = "Overweight";
    }else{
      bmiResult = "Obese";
    }


    Message.result= bmiResult;


  }







  low() {
    low_weight = 18.5 *  ((double.parse(height.text) * 0.01 )*(double.parse(height.text) * 0.01 ));
    Message.minweight = (low_weight * 100).round() / 100; 
  }

  high() {
    high_weight = 24.9 *  ((double.parse(height.text) * 0.01 )*(double.parse(height.text) * 0.01 ));
    Message.maxweight = (high_weight * 100).round() / 100; 
  }









} // end