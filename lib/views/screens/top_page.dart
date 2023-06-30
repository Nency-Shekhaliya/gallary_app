import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/helper/api_helper.dart';

class Top_image_page extends StatefulWidget {
  const Top_image_page({Key? key}) : super(key: key);

  @override
  State<Top_image_page> createState() => _Top_image_pageState();
}

class _Top_image_pageState extends State<Top_image_page> {
  late Future dataval;
  void initState() {
    super.initState();

    dataval = Api_Helper.api_helper.getImage(category: "popular images");
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
                color: Colors.white),
          ),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: [
            Icon(
              Icons.dark_mode,
              color: Colors.white,
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
                        dataval = Api_Helper.api_helper.getImage(category: val);
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: FutureBuilder(
                    future: dataval,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error Ouccured:${snapshot.error}'),
                        );
                      } else if (snapshot.hasData) {
                        List allData = snapshot.data as List;
                        return MasonryGridView.count(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.all(8),
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          itemCount: allData.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  'View_Screen',
                                  arguments: allData[index].image,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(allData[index].image),
                                    opacity: 0.9,
                                    colorFilter:
                                        const ColorFilter.srgbToLinearGamma(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Image(
                                  image: NetworkImage(allData[index].image),
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
                          color: Colors.red,
                          strokeWidth: 2,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
