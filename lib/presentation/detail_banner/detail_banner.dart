import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailBanner extends StatelessWidget {
  final String? img;
  const DetailBanner({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Image.network(img.toString()),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          icon: Icon(Icons.download),
          onPressed: () {
            print("Tải xuống được nhấn");
          },
        ),
        Gap(10),
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            print("Chia sẻ được nhấn");
          },
        ),
        Gap(10),
      ],
    );
  }
}
