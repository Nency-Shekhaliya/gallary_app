import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cname_page.dart';

class Categories_page extends StatefulWidget {
  const Categories_page({Key? key}) : super(key: key);

  @override
  State<Categories_page> createState() => _Categories_pageState();
}

class _Categories_pageState extends State<Categories_page> {
  List Cname = [
    {'name': "Animals", "api": "Animals"},
    {'name': "Food", "api": "Food"},
    {'name': "Car", "api": "Car"},
    {'name': "Cartoons", "api": "Cartoons"},
    {'name': "Flowers", "api": "Flowers images"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              children: Cname.map((e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Category_name_page(
                          name: e['name'],
                          api: e['api'],
                        ),
                      ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                      height: 100,
                      width: 350,
                      color: Colors.pink,
                      child: Text(
                        e['name'],
                        style: GoogleFonts.aladin(fontSize: 30),
                      ),
                    ),
                  )).toList()),
        ),
      ),
    );
  }
}
