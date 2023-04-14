import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/home.dart';
import 'package:test/model/profile_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int currentStep = 0;

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController houseNo = TextEditingController();
  TextEditingController villageNo = TextEditingController();
  TextEditingController subDistrict = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController id = TextEditingController();

  List<Step> stepList() => [
        Step(
          state: currentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: currentStep >= 0,
          title: const Text('ข้อมูลส่วนตัว'),
          content: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: textFieldName('ชื่อ', firstname),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: textFieldName('นามสกุล', lastname),
                    )
                  ],
                ),
                textFieldName('ชื่อเล่น', nickname),
                textFieldName('อีเมล', email),
                textFieldName('เบอร์โทรศัพท์', phone),
                textFieldName('รหัสประจำตัวประชาชน', id),
              ],
            ),
          ),
        ),
        Step(
            state: currentStep <= 1 ? StepState.editing : StepState.complete,
            isActive: currentStep >= 1,
            title: const Text('ที่อยู่'),
            content: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: textFieldName('บ้านเลขที่', houseNo)),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(child: textFieldName('หมู่ที่', villageNo)),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                  textFieldName('ตำบล', subDistrict),
                  textFieldName('อำเภอ', district),
                  textFieldName('จังหวัด', province),
                  textFieldName('รหัสไปรษณีย์', postalCode)
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: currentStep >= 2,
            title: const Text('ยืนยัน'),
            content: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('ชื่อ: ${firstname.text} ${lastname.text}'),
                Text('ชื่อเล่น: ${nickname.text}'),
                Text('อีเมล: ${email.text}'),
                Text('เบอร์โทรศัพท์: ${nickname.text}'),
                Text('รหัสประจำตัวประชาชน: ${email.text}'),
                Text(
                    'ที่อยู่ : บ้านเลขที่ ${houseNo.text} หมู่ที่ ${villageNo.text} ตำบล ${subDistrict.text} อำเภอ ${district.text} จังหวัด ${province.text} รหัสไปรษณีย์ ${postalCode.text}'),
              ],
            )))
      ];

  Padding textFieldName(String text, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('เพิ่มข้อมูล'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.backspace_rounded),
        ),
      ),
      body: Center(
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: currentStep,
          onStepTapped: (int index) {
            setState(() {
              currentStep = index;
            });
          },
          onStepContinue: () {
            if (currentStep < (stepList().length - 1)) {
              setState(() {
                currentStep += 1;
              });
            } else {
              print('ชื่อ: ${firstname.text} ${lastname.text}');
              print('ชื่อเล่น: ${nickname.text}');
              print('อีเมล: ${email.text}');
              print('เบอร์โทรศัพท์: ${nickname.text}');
              print('รหัสประจำตัวประชาชน: ${email.text}');
              print(
                  'ที่อยู่ : บ้านเลขที่ ${houseNo.text} หมู่ที่ ${villageNo.text} ตำบล ${subDistrict} อำเภอ ${district} จังหวัด ${province} รหัสไปรษณีย์ ${postalCode}');

              ProfileModel profile = ProfileModel(
                  firstname.text,
                  lastname.text,
                  nickname.text,
                  email.text,
                  phone.text,
                  houseNo.text,
                  villageNo.text,
                  subDistrict.text,
                  district.text,
                  province.text,
                  postalCode.text,
                  id.text);

              Navigator.pop(context, profile);
            }
          },
          onStepCancel: () {
            if (currentStep == 0) {
              return;
            }
            setState(() {
              currentStep -= 1;
            });
          },
          steps: stepList(),
        ),
      ),
    );
  }
}
