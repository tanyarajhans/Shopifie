import 'package:flutter/material.dart';
import 'package:shopifie/inner_screens/upload_product.dart';
import 'package:shopifie/screens/bottom_bar.dart';
import 'package:shopifie/screens/landing_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [BottomBar(), UploadProductForm()],
    );
  }
}