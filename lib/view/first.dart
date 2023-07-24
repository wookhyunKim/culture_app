import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {


  //property
  late int ageRadioValue;
  late String iconImage; 
  late String imageRank; 

  @override
  void initState() {
    super.initState();
    ageRadioValue = 1;
    iconImage = "images/노인.png";
    imageRank = "images/grandparents.png";
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text("data"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 1,
                    groupValue: ageRadioValue,
                    onChanged: (value) {
                      _radioChange(value);
                      changeImage(value);
                    },
                  ),
                  const Text(
                    "노인",
                  ),
                  Radio(
                    value: 2,
                    groupValue: ageRadioValue,
                    onChanged: (value) {
                      _radioChange(value);
                      changeImage(value);
                    },
                  ),
                  const Text(
                    "성인",
                  ),
                  Radio(
                    value: 4,
                    groupValue: ageRadioValue,
                    onChanged: (value) {
                      _radioChange(value);
                      changeImage(value);
                    },
                  ),
                  const Text(
                    "유소년",
                  ),
                  Radio(
                    value: 3,
                    groupValue: ageRadioValue,
                    onChanged: (value) {
                      _radioChange(value);
                      changeImage(value);
                    },
                  ),
                  const Text(
                    "청소년",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  iconImage,
                ),
                radius: 140,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                imageRank,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        move1st(context);
                        Navigator.pushNamed(context, "/2nd");
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
                        "등급확인",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/bmi1st");
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
                        "BMI 측정",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }




  _radioChange(int? value) {
    // type이 int? 이유는 radio 가 check 될 수 도 있고 안 될 수도 있기 때문
    ageRadioValue = value!;
    setState(() {});
  }



changeImage(int? value){
  ageRadioValue=value!;
  switch(ageRadioValue){
    case 1:
    iconImage = "images/노인.png";
    imageRank = "images/grandparents.png";
    case 2:
    iconImage = "images/성인.png";
    imageRank = "images/adult.png";
    case 3:
    iconImage = "images/유소년.png";
    imageRank = "images/youth.png";
    case 4:
    iconImage = "images/청소년.png";
    imageRank = "images/teenager.png";
    
  }
  setState(() {
    
  });
}




  move1st(BuildContext context){
    Navigator.pop(context);  // 메모리에서 secondpage 지우기 
  }








}//end
