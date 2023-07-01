import 'package:flutter/material.dart';

class Image_Page extends StatefulWidget {
  String image;
  Image_Page({Key? key, required this.image}) : super(key: key);

  @override
  State<Image_Page> createState() => _Image_PageState();
}

class _Image_PageState extends State<Image_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 16,
            ),
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.5),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: Container(
      //   height: 50,
      //   width: 50,
      //   alignment: Alignment.center,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(15),
      //     color: Colors.blue.shade700,
      //   ),
      //   child: GestureDetector(
      //     onTap: () {
      //       _save();
      //     },
      //     child: const Icon(
      //       Icons.download,
      //       color: Colors.white,
      //       size: 30,
      //     ),
      //   ),
      // ),
    );
  }
}
