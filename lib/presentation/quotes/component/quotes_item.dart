import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class QuotesItem extends StatelessWidget {
  const QuotesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.red,
        ),
      ),
      child: Column(
        children: [
          Container(
            child: Text(
              '“Cuộc sống có quyền đẩy bạn ngã nhưng ngồi đó than khóc hay đứng dậy và tiếp tục là quyền của bạn”.',
              softWrap: true,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Gap(10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.copy),
                ),
                Gap(10),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
