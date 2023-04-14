import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:test/details.dart';
import 'package:test/model/profile_model.dart';
import 'package:test/provider/appData.dart';
import 'package:test/register.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  List<ProfileModel> proList =
      List.filled(0, ProfileModel.empty(), growable: true);

  @override
  void initState() {
    // readJson();
    super.initState();
    ProfileModel profile = ProfileModel(
        "แพว",
        "อิอิ",
        "ตุตะ",
        "test@mail.com",
        "095243888",
        "55",
        "9",
        "หนองนน้ำ",
        "หนองน้ำนะ",
        "มหาสารคาม",
        "44150",
        "123");
    proList.add(profile);

    //readJson();
  }

  // Future<void> readJson() async {
  //   final String response = await rootBundle.loadString('assets/users.json');
  //   final data = await json.decode(response);
  //   //print(data);
  //   for (var e in data) {
  //     print(e);
  //     proList.add(ProfileModel(
  //         e["firstname"].toString(),
  //         e["lastname"].toString(),
  //         e["nickname"].toString(),
  //         e["email"].toString(),
  //         e["phone"].toString(),
  //         e["houseNo"].toString(),
  //         e["villageNo"].toString(),
  //         e["subDistrict"].toString(),
  //         e["district"].toString(),
  //         e["province"].toString(),
  //         e["postalCode"].toString(),
  //         e["id"].toString()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: Text('เพิ่มข้อมูล'),
          icon: Icon(Icons.edit),
          onPressed: () => {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()))
                .then((value) {
              if (value == null) {
              } else {
                proList.add(value);
              }

              setState(() {});
            })
          },
        ),
        appBar: AppBar(
          title: Text("รายชื่อ"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: TabBar(
                      indicator: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8)),
                      tabs: const [
                        Tab(
                          text: 'ทั้งหมด',
                        ),
                        Tab(
                          text: 'จังหวัด',
                        )
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 500,
                child: TabBarView(
                  children: [
                    Container(
                      child: (proList.length != 0)
                          ? ListView.builder(
                              itemCount: proList.length,
                              itemBuilder: (context, int index) {
                                return Card(
                                  child: ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text(
                                        '${proList[index].firstname} ${proList[index].lastname}'),
                                    subtitle: Text(proList[index].email),
                                    trailing: Wrap(
                                      children: <Widget>[
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'ลบข้อมูล'),
                                                      content: const Text(
                                                          'ต้องการที่จะลบข้อมูลหรือไหม?'),
                                                      actions: [
                                                        ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary: Colors
                                                                        .green),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'ยกเลิก')),
                                                        ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary:
                                                                        Colors
                                                                            .red),
                                                            onPressed: () {
                                                              proList.removeWhere(
                                                                  (element) =>
                                                                      element
                                                                          .id ==
                                                                      proList[index]
                                                                          .id);
                                                              setState(() {});
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                              'ลบ',
                                                            )),
                                                      ],
                                                    );
                                                  });
                                            },
                                            icon: Icon(Icons.delete))
                                      ],
                                    ),
                                    onTap: () {
                                      context.read<AppData>().profileModel =
                                          proList[index];
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsPage()));
                                    },
                                  ),
                                );
                              })
                          : Container(),
                    ),
                    Container(
                        child: (proList.length != 0)
                            ? GroupedListView<ProfileModel, String>(
                                elements: proList,
                                groupBy: (proList) => proList.province,
                                groupSeparatorBuilder: (String groupByValue) =>
                                    Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(groupByValue,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                itemBuilder: (context, proList) => Card(
                                  child: ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text(proList.firstname),
                                    subtitle: Text(proList.email),
                                    onTap: () {
                                      context.read<AppData>().profileModel =
                                          proList;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsPage()));
                                    },
                                  ),
                                ),
                              )
                            : Container())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
