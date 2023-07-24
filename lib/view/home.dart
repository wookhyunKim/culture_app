import 'package:culture_app/model/message.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late TextEditingController measureNum; // 측정회차
  late TextEditingController age; // 연령
  late int _radioValue; // 라디오버튼
  late String agePart; // 연령구분1
  late int ageNum;
  late double rank;

  @override
  void initState() {
    super.initState();
    measureNum = TextEditingController(text: "1");
    age = TextEditingController(text: "30");
    _radioValue = 1;
    agePart= "성인";
    ageNum=1;
    rank=0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 50.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "images/physical100.png",
                  ),
                  radius: 150,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("측정회차 : "),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: TextField(
                        controller: measureNum,
                        // 일하는 것은 컨트롤러 글씨가 바뀌는 것을 탐지 setState가 없어도된다.
                        decoration: const InputDecoration(
                          labelText: "측정회차를 입력하세요", // 글자없어지지 않음
                          border: OutlineInputBorder(), // 텍스트필드 테두리
                        ),
                        keyboardType: TextInputType.number, // 키보드 형태
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("측정연령 : "),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: TextField(
                        controller: age,
                        // 일하는 것은 컨트롤러 글씨가 바뀌는 것을 탐지 setState가 없어도된다.
                        decoration: const InputDecoration(
                          labelText: "연령을 입력하세요", // 글자없어지지 않음
                          border: OutlineInputBorder(), // 텍스트필드 테두리
                        ),
                        keyboardType: TextInputType.number, // 키보드 형태
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("측정장소 : "),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _radioValue,
                          onChanged: (value) {
                            _radioChange(value);
                          },
                        ),
                        const Text("일반"),
                        Radio(
                          value: 2,
                          groupValue: _radioValue,
                          onChanged: (value) {
                            _radioChange(value);
                          },
                        ),
                        const Text("출장"),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  calcRank();
                  Navigator.pushNamed(context, "/1st");
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
                  "측정",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _radioChange(int? value) {
    // type이 int? 이유는 radio 가 check 될 수 도 있고 안 될 수도 있기 때문
    _radioValue = value!;
    setState(() {});
  }

  getRadio(int radioValue) {
    switch (radioValue) {
      case 1:
        return "일반";
      case 2:
        return "출장";
    }
  }


judgeAge(){
  if(int.parse(age.text)>64){
    agePart = "노인";
    ageNum=1;
  }else if(int.parse(age.text)>18){
    agePart = "성인";
    ageNum=2;
  }else if(int.parse(age.text)>12){
    agePart = "청소년";
    ageNum=4;
  }else if(int.parse(age.text)>10){
    agePart = "유소년";
    ageNum=3;
  }else{
    agePart = "유아기";
  }
}



// 등급계산
calcRank() {
    rank = (-0.046957)*int.parse(measureNum.text)+0.224767*_radioValue+(-0.004483)*int.parse(age.text)+(-0.006809)*ageNum+3.226852;
    rank = ((rank*1).ceil()/1);
    Message.rank=rank;
  }











} // end 
