import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../contoller/provider.dart';
import 'home_screen.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  bool isLanguage = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final proVar = Provider.of<JsonProvider>(context, listen: true);

    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/geetaback.jpg',
                ),
                fit: BoxFit.cover)),
      ),
      Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'CHANGE THEME:',
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff35220D),
                    fontWeight: FontWeight.w700),
              ),
              Switch(
                  thumbColor: MaterialStatePropertyAll(Colors.brown.shade700),
                  activeTrackColor: Colors.white,
                  value: proVar.getTheme,
                  onChanged: (value) {
                    proVar.setTheme = value;
                  })
            ],
          ),
          SizedBox(
            height: height - 230,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen(isLan: true),
                  ));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'ENGLISH',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.brown.shade900,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen(isLan: false),
                  ));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'HINDI',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.brown.shade900,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ]));
  }
}
