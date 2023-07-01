import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallary_app/controller/helper/api_helper.dart';
import 'package:gallary_app/views/screens/image_page.dart';

import '../../modal/global_color.dart';

class Category_name_page extends StatefulWidget {
  String name;
  String api;
  Category_name_page({Key? key, required this.name, required this.api})
      : super(key: key);

  @override
  State<Category_name_page> createState() => _Category_name_pageState();
}

class _Category_name_pageState extends State<Category_name_page> {
  late Future dataval;
  void initState() {
    super.initState();

    dataval = Api_Helper.api_helper.apiImage(category: widget.api);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  onChanged: (val) async {
                    setState(() {
                      dataval = Api_Helper.api_helper.apiImage(category: val);
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Global.textcolor,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Global.textcolor,
                      )),
                ),
              ),
              Expanded(
                flex: 12,
                child: FutureBuilder(
                  future: dataval,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error :${snapshot.error}'),
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
      ),
      backgroundColor: Global.bgcolor,
    );
  }
}
