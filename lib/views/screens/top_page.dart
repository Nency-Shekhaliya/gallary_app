import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/helper/api_helper.dart';
import '../../modal/global_color.dart';
import 'image_page.dart';

class Top_image_page extends StatefulWidget {
  const Top_image_page({Key? key}) : super(key: key);

  @override
  State<Top_image_page> createState() => _Top_image_pageState();
}

class _Top_image_pageState extends State<Top_image_page> {
  late Future dataval;
  void initState() {
    super.initState();

    dataval = Api_Helper.api_helper.apiImage(category: "popular images");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gallery",
          style: GoogleFonts.aladin(
              fontSize: 30,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              color: Global.textcolor),
        ),
        backgroundColor: Global.appbarcolor,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                Global.appbarcolor = Colors.white;
                Global.textcolor = Colors.black;
                Global.bottomcolor = Colors.white;
                Global.lightbtn = Colors.black;
                Global.bgcolor = Colors.white;
              });
            },
            child: Icon(
              Icons.dark_mode,
              color: Global.lightbtn,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (val) async {
                    setState(() {
                      dataval = Api_Helper.api_helper.apiImage(category: val);
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Global.textcolor),
                      prefixIcon: Icon(Icons.search, color: Global.textcolor)),
                ),
              ),
              Expanded(
                flex: 8,
                child: FutureBuilder(
                  future: dataval,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error:${snapshot.error}'),
                      );
                    } else if (snapshot.hasData) {
                      List Data = snapshot.data as List;
                      return MasonryGridView.count(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(8),
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemCount: Data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Image_Page(image: Data[index].image),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(Data[index].image),
                                  opacity: 0.9,
                                  colorFilter:
                                      const ColorFilter.srgbToLinearGamma(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Image(
                                image: NetworkImage(Data[index].image),
                                fit: BoxFit.fitHeight,
                                color: Colors.white.withOpacity(0.0),
                                colorBlendMode: BlendMode.modulate,
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Global.bgcolor,
    );
  }
}
