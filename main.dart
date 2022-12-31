// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bebekisim/data.dart';
import 'package:flutter/material.dart';
import 'database.dart';

void main() {
  runApp(const MyApp());
}

bool isSwitched = false;
String firstChar = "i";
String lastChar = "A";
String secilenCinsiyet = "Unisex";
String a = "";
String b = "";
String c = "";
String d = "";
String e = "";
String f = "";
var cinsiyetler = [
  'Erkek',
  'Kiz',
  'Unisex',
];
List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "Erkek", child: Text("Erkek")),
    DropdownMenuItem(value: "Kiz", child: Text("Kiz")),
    DropdownMenuItem(value: "Unisex", child: Text("Unisex")),
  ];
  return menuItems;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bebek İsim',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bebek isim yaratici'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "İdeal Bebek İsminizi Bulalim ",
                  style: TextStyle(fontSize: 16, fontFamily: "VesperLibre"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4, top: 10),
                        child: const Text("İsim Cinsiyeti : ",
                            style: TextStyle(
                                fontSize: 16, fontFamily: "VesperLibre")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: DropdownButton(
                          value: secilenCinsiyet,
                          items: dropdownItems,
                          onChanged: (value) {
                            setState(() {
                              secilenCinsiyet = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                  child: Row(
                    children: [
                      const Text("Türkçe Karakter içersin mi?",
                          style: TextStyle(
                              fontSize: 16, fontFamily: "VesperLibre")),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Switch(
                          // activeColor: Colors.amber,
                          //activeTrackColor: Colors.blue,
                          onChanged: (bool value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          value: isSwitched,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Hangi Harf ile başlasin",
                        style:
                            TextStyle(fontFamily: "VesperLibre", fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: MediaQuery.of(context).size.width / 30 * 23),
                  child: TextFormField(
                    maxLength: 1,
                    decoration: const InputDecoration(
                      hintText: 'İsmin ilk harfi',
                      labelText: 'İlk Harf',
                    ),
                    onChanged: (value) {
                      firstChar = value;
                    },
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Hangi Harf ile bitsin",
                        style:
                            TextStyle(fontFamily: "VesperLibre", fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: MediaQuery.of(context).size.width / 30 * 23),
                  child: TextFormField(
                    maxLength: 1,
                    decoration: const InputDecoration(
                      hintText: 'İsmin son harfi?',
                      labelText: 'Son harf',
                    ),
                    onChanged: (value) {
                      lastChar = value;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 200 * 102),
                      child: ButtonBar(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(75, 42),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              isimBul(
                                secilenCinsiyet,
                                isSwitched,
                                firstChar,
                                lastChar,
                              );
                              setState(() {});
                            },
                            child: Text("Yarat"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 14,
                      top: 10,
                      right: MediaQuery.of(context).size.width / 60 * 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 2 / 8,
                        child: Center(child: Text(a)),
                        decoration: BoxDecoration(
                            color: Color(0xffa881af),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 2 / 8,
                        child: Center(child: Text(b)),
                        decoration: BoxDecoration(
                            color: Color(0xffa881af),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 2 / 8,
                        child: Center(child: Text(c)),
                        decoration: BoxDecoration(
                            color: Color(0xffa881af),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 2,
                      right: MediaQuery.of(context).size.width / 60 * 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 2 / 8,
                        child: Center(child: Text(d)),
                        decoration: BoxDecoration(
                            color: Color(0xffa881af),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 2 / 8,
                        child: Center(child: Text(e)),
                        decoration: BoxDecoration(
                            color: Color(0xffa881af),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 2 / 8,
                        child: Center(child: Text(f)),
                        decoration: BoxDecoration(
                            color: Color(0xffa881af),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 4,
                          left: MediaQuery.of(context).size.width / 18 * 7),
                      child: ButtonBar(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(140, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: () {},
                              child: Text("Tamamını Gör"))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<String> isimBul(cinsiyet, switchValue, String ilkHarf, String sonHarf) {
  List<String> uygunIsim = [];
  if (cinsiyet == "Erkek" || cinsiyet == "Unisex") {
    for (var i = 0; i < 7792; i++) {
      if (erkekIsim[i].startsWith(ilkHarf.toUpperCase()) &&
          erkekIsim[i].endsWith(sonHarf.toLowerCase())) {
        if (switchValue == true && validateTurkcekarakter(erkekIsim[i])) {
          uygunIsim.add(erkekIsim[i]);
        }
        if (switchValue == false) {
          uygunIsim.add(erkekIsim[i]);
        }
      }
    }
  }
  if (cinsiyet == "Kiz" || cinsiyet == "Unisex") {
    for (var i = 0; i < 5340; i++) {
      if (kizIsim[i].startsWith(ilkHarf.toUpperCase()) &&
          kizIsim[i].endsWith(sonHarf.toLowerCase())) {
        if (switchValue == true && validateTurkcekarakter(kizIsim[i])) {
          uygunIsim.add(kizIsim[i]);
        }
        if (switchValue == false) {
          uygunIsim.add(kizIsim[i]);
        }
      }
    }
  }
  uygunIsim.shuffle();
  if (uygunIsim.length >= 6) {
    a = uygunIsim[0];
    d = uygunIsim[1];
    e = uygunIsim[2];
    f = uygunIsim[3];
    c = uygunIsim[4];
    b = uygunIsim[5];
  }

  return uygunIsim;
}

bool validateTurkcekarakter(String value) {
  String cem = "Cem";
  List<String> kontrolSeti = ["Ğ", "ğ", "ç", "Ç", "ı", "İ", "Ü", "ü", "ö", "Ö"];
  int a = 0;
  for (var i = 0; i < kontrolSeti.length; i++) {
    if (!cem.contains(kontrolSeti[i])) {
      a = a + 1;
    }
  }
  if (a == 10) {
    return true;
  } else {
    return false;
  }
}
