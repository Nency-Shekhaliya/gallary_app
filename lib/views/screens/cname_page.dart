import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallary_app/controller/helper/api_helper.dart';

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

    dataval = Api_Helper.api_helper.getImage(category: widget.api);
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
                flex: 12,
                child: FutureBuilder(
                  future: dataval,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error :${snapshot.error}'),
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
      ),
    );
  }
}
