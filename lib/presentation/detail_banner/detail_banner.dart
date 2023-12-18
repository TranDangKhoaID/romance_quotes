import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailBanner extends StatelessWidget {
  final String? img;
  final void Function()? onDownload;
  final void Function()? onShare;
  const DetailBanner({
    super.key,
    required this.img,
    required this.onDownload,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Image.network(
          img.toString(),
          fit: BoxFit.cover,
        ),
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
          onPressed: onDownload,
        ),
        Gap(10),
        IconButton(
          icon: Icon(Icons.share),
          onPressed: onShare,
        ),
        Gap(10),
      ],
    );
  }
}
