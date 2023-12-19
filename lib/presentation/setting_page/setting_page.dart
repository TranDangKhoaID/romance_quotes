import 'package:flutter/material.dart';
import 'package:romance_quotes/app/manager/color_manager.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        elevation: 0,
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(
                Icons.rate_review,
                color: AppColors.primary,
              ),
              onTap: () {},
              title: const Text(
                "Đánh giá ứng dụng",
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: AppColors.primary,
              ),
              onTap: () {},
              title: const Text(
                "Chia sẻ ứng dụng",
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: AppColors.primary,
              ),
              onTap: () {},
              title: const Text(
                "Chính sách bảo mật",
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(
                Icons.bookmark,
                color: AppColors.primary,
              ),
              onTap: () {},
              title: const Text(
                "Các điều khoản và điều kiện",
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(
                Icons.contact_support,
                color: AppColors.primary,
              ),
              onTap: () {},
              title: const Text(
                "Liên hệ hỗ trợ",
              ),
              subtitle:
                  const Text('Gửi email đến bộ phận hỗ trợ của chúng tôi'),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            const Divider(
              height: 1,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
