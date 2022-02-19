import 'package:backdrop/backdrop.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopifie/widget/category.dart';
import 'package:shopifie/widget/popular_products.dart';

import '../consts/colors.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropScaffold(
        frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: BackdropAppBar(
          title: Text("Home"),
          leading: BackdropToggleButton(
        icon: AnimatedIcons.menu_home
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            ColorsConsts.starterColor,
            ColorsConsts.endColor
          ])
        ),
      ),
          actions:  <Widget>[
            IconButton(
              iconSize: 15,
              onPressed: () {
                
              }, 
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 13,
                  backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                )
              )
            )
          ],
        ),
        backLayer: const Center(
          child: Text("Back Layer"),
        ),
        frontLayer: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height:190,
                width: double.infinity,
                child: CarouselSlider(
                options: CarouselOptions(),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                              child:
                                  Image.network(item, fit: BoxFit.cover, width: 1000)),
                        ))
                    .toList(),
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                  Text('Categories', 
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20.0
                  ),),
                ),
              Container(
                height: 180,
                width: double.infinity,
                
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                  return Category(index);
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('Popular Products', 
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20.0
                  ),),
                  Spacer(),
                  TextButton(onPressed: (){}, child: Text('View All', 
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15.0,
                    color: Colors.red
                  ),),)
                ],),
              ),
              Container(
                height: 255,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 3),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index){
                  return PopularProducts();
                })
              ),
            ],
          ),
        )
      ),
      
    );
  }
}