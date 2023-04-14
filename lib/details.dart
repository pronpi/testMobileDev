import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/provider/appData.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('รายละเอียด'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'ชื่อ : ${context.read<AppData>().profileModel.firstname} ${context.read<AppData>().profileModel.lastname}'),
              Text(
                  'ชื่อเล่น : ${context.read<AppData>().profileModel.nickname}'),
              Text('อีเมล : ${context.read<AppData>().profileModel.email}'),
              Text(
                  'เบอร์โทรศัพท์ : ${context.read<AppData>().profileModel.phone}'),
              Text(
                  'รหัสบัตรประชาชน : ${context.read<AppData>().profileModel.id}'),
              Text(
                  'ที่อยู่ : บ้านเลขที่ ${context.read<AppData>().profileModel.houseNo} หมู่ที่ ${context.read<AppData>().profileModel.villageNo} ตำบล ${context.read<AppData>().profileModel.subDistrict} อำเภอ ${context.read<AppData>().profileModel.district} จังหวัด ${context.read<AppData>().profileModel.province} รหัสไปรษณี ${context.read<AppData>().profileModel.postalCode}'),
            ],
          ),
        ));
  }
}
