// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bebekisim/data.dart';
import 'package:bebekisim/detaySayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

bool isSwitched = false;
String firstChar = "";
String lastChar = "";
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
final List<String> uygunIsim = [];
Color clr = Color(0xffE8D9C2);
Color clr2 = Color(0xffa39789);
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
      theme: ThemeData(primarySwatch: Colors.blueGrey),
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
                Padding(
                  padding: const EdgeInsets.only(top: 17),
                  child: const Text(
                    "İdeal Bebek İsminizi Bulalim ",
                    style: TextStyle(fontSize: 21, fontFamily: "VesperLibre"),
                  ),
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
                          activeColor: Color(0xff8f9e81),
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
                    cursorColor: Color(0xff8f9e81),
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
                    cursorColor: Color(0xff8f9e81),
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
                          left: MediaQuery.of(context).size.width / 200 * 124),
                      child: ButtonBar(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: clr2,
                              fixedSize: Size(75, 42),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              isimBul(secilenCinsiyet, isSwitched, firstChar,
                                  lastChar, context);
                              String cem = "cem";
                              debugPrint(cem.startsWith("k").toString());
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
                      top: 20,
                      right: MediaQuery.of(context).size.width / 60 * 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 2 / 8,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(
                                    1, 2.5), // changes position of shadow
                              ),
                            ],
                            color: clr,
                            border: Border.all(width: 1.6),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(a,
                                style: TextStyle(
                                    fontFamily: "NotoSerif", fontSize: 14))),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 2 / 8,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(
                                    1, 2.5), // changes position of shadow
                              ),
                            ],
                            color: clr,
                            border: Border.all(width: 1.6),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(b,
                                style: TextStyle(
                                    fontFamily: "NotoSerif", fontSize: 14))),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 2 / 8,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(
                                    1, 2.5), // changes position of shadow
                              ),
                            ],
                            color: clr,
                            border: Border.all(width: 1.6),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(c,
                              style: TextStyle(
                                  fontFamily: "NotoSerif", fontSize: 14)),
                        ),
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
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(
                                    1, 2.5), // changes position of shadow
                              ),
                            ],
                            color: clr,
                            border: Border.all(width: 1.6),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(d,
                                style: TextStyle(
                                    fontFamily: "NotoSerif", fontSize: 14))),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 2 / 8,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(
                                    1, 2.5), // changes position of shadow
                              ),
                            ],
                            color: clr,
                            border: Border.all(width: 1.6),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            e,
                            style: TextStyle(
                                fontFamily: "NotoSerif", fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 2 / 8,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(
                                    1, 2.5), // changes position of shadow
                              ),
                            ],
                            color: clr,
                            border: Border.all(width: 1.6),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(f,
                                style: TextStyle(
                                    fontFamily: "NotoSerif", fontSize: 14))),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10,
                          left: MediaQuery.of(context).size.width / 100 * 48),
                      child: ButtonBar(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: clr2,
                                fixedSize: Size(140, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (BuildContext ctx) =>
                                        MyWidget(list: uygunIsim)));
                              },
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

List<String> isimBul(
    cinsiyet, switchValue, String ilkHarf, String sonHarf, context) {
  uygunIsim.clear();
  a = "";
  d = "";
  e = "";
  f = "";
  c = "";
  b = "";

  if (cinsiyet == "Erkek" || cinsiyet == "Unisex") {
    for (var i = 0; i < 7792; i++) {
      if (ilkHarf == "" && sonHarf != "") {
        if (erkekIsim[i].endsWith(sonHarf.toLowerCase())) {
          if (switchValue == true && validateTurkcekarakter(erkekIsim[i])) {
            uygunIsim.add(erkekIsim[i]);
          }
          if (switchValue == false) {
            uygunIsim.add(erkekIsim[i]);
          }
        }
      } else if (sonHarf == "" && ilkHarf != "") {
        if (erkekIsim[i].startsWith(ilkHarf.toUpperCase())) {
          if (switchValue == true && validateTurkcekarakter(erkekIsim[i])) {
            uygunIsim.add(erkekIsim[i]);
          }
          if (switchValue == false) {
            uygunIsim.add(erkekIsim[i]);
          }
        }
      } else if (sonHarf == "" && ilkHarf == "") {
        if (switchValue == true && validateTurkcekarakter(erkekIsim[i])) {
          uygunIsim.add(erkekIsim[i]);
        }
        if (switchValue == false) {
          uygunIsim.add(erkekIsim[i]);
        }
      } else {
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
  }
  if (cinsiyet == "Kiz" || cinsiyet == "Unisex") {
    for (var i = 0; i < 5340; i++) {
      if (ilkHarf == "" && sonHarf != "") {
        if (kizIsim[i].endsWith(sonHarf.toLowerCase())) {
          if (switchValue == true && validateTurkcekarakter(kizIsim[i])) {
            uygunIsim.add(kizIsim[i]);
          }
          if (switchValue == false) {
            uygunIsim.add(kizIsim[i]);
          }
        }
      } else if (sonHarf == "" && ilkHarf != "") {
        if (kizIsim[i].startsWith(ilkHarf.toUpperCase())) {
          if (switchValue == true && validateTurkcekarakter(kizIsim[i])) {
            uygunIsim.add(kizIsim[i]);
          }
          if (switchValue == false) {
            uygunIsim.add(kizIsim[i]);
          }
        }
      } else if (sonHarf == "" && ilkHarf == "") {
        if (switchValue == true && validateTurkcekarakter(kizIsim[i])) {
          uygunIsim.add(kizIsim[i]);
        }
        if (switchValue == false) {
          uygunIsim.add(kizIsim[i]);
        }
      } else {
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
  }
  uygunIsim.shuffle();
  if (uygunIsim.length >= 6) {
    a = uygunIsim[0];
    d = uygunIsim[1];
    e = uygunIsim[2];
    f = uygunIsim[3];
    c = uygunIsim[4];
    b = uygunIsim[5];
  } else if (uygunIsim.length < 6) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Hay Aksi!',
        message: 'Aradığınız kriterlerde yeterince isim bulamadık!',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  return uygunIsim;
}

bool validateTurkcekarakter(String value) {
  List<String> kontrolSeti = ["Ğ", "ğ", "ç", "Ç", "ı", "İ", "Ü", "ü", "ö", "Ö"];
  int a = 0;
  for (var i = 0; i < kontrolSeti.length; i++) {
    if (!value.contains(kontrolSeti[i])) {
      a = a + 1;
    }
  }
  if (a == 10) {
    return true;
  } else {
    return false;
  }
}
