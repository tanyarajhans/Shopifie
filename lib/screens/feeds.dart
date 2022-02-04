import 'package:flutter/material.dart';
import 'package:shopifie/widget/feeds_products.dart';

class Feeds extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: FeedProducts(),)
    );
  }
}