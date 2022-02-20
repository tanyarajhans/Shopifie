import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/consts/colors.dart';
import 'package:shopifie/provider/dark_theme_provider.dart';
import 'package:shopifie/screens/wishlist.dart';

class UserInfo extends StatefulWidget {
  @override
  State<UserInfo> createState() => _UserInfoState();
}

ScrollController _scrollController = ScrollController();
class _UserInfoState extends State<UserInfo> {
  
  
  var top=0.0;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        body: Stack(
        children: [CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                // leading: Icon(Icons.ac_unit_outlined),
                // automaticallyImplyLeading: false,
                elevation: 0,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;

                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            ColorsConsts.starterColor,
                            ColorsConsts.endColor,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      // collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: top <= 110.0 ? 1.0 : 0,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              height: kToolbarHeight / 1.8,
                              width: kToolbarHeight / 1.8,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 1.0,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              // 'top.toString()',
                              'Guest',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        ),
            
                    ),
                    background: Image(
                        image: NetworkImage(
                            'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                        fit: BoxFit.fill,
                      ),
                    )
                  );                 
                 }
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: UserTitle('User Bag')
                      ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => {
                          Navigator.pushNamed(context, Wishlist.routeName)
                        },
                        splashColor: Colors.red,
                        child: ListTile(
                          title: Text('Wishlist'),
                          trailing: Icon(Icons.chevron_right_rounded),
                          leading: Icon(Icons.favorite),
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        
                      },
                      title: Text('Cart'),
                      trailing: Icon(Icons.chevron_right_rounded),
                      leading: Icon(Icons.shopping_cart),
                    ),
                    ListTile(
                      onTap: () => (){},
                      title: Text('My Orders'),
                      trailing: Icon(Icons.chevron_right_rounded),
                      leading: Icon(Icons.shopping_bag),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: UserTitle('User Information'),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),

                    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserListTile('Email', 'Email sub', 0, (){}),
          UserListTile('Phone', '4555', 1, (){}),
          UserListTile('Shipping Address', '', 2, (){}),
          UserListTile('Joined date', 'date', 3, (){}),
          ListTileSwitch(  
	    value: themeChange.darkTheme,  
		leading: Icon(Icons.mode_night_outlined),  
		onChanged: (value) {  
		  setState(() {  
			themeChange.darkTheme = value;  
		  });
		},
		switchType: SwitchType.cupertino,
		switchActiveColor: Colors.indigo,  
		title: Text('Dark Theme'),  
	 ),
   UserListTile('Logout', '', 4, (){}),
        ]
      )
                
      ]
                )
              ),
              
            //  _buildFab() 
            ],
            ),
            _buildFab()
            ]
            )
            );
  }

  
  }

Widget _buildFab() {

    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart/2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down

        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down

        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }
  
    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  
}

class Title extends StatelessWidget {
  
  String title;
  Title(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold
      )),
    );
  }
}

List<IconData> _userTileIcons = [
  Icons.email,
  Icons.phone,
  Icons.local_shipping,
  Icons.watch_later,
  Icons.exit_to_app_rounded
];

class UserListTile extends StatelessWidget {
  
  String title;
  String subtitle;
  int index;
  Function()? onTap;

  UserListTile(this.title, this.subtitle, this.index, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).splashColor,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(_userTileIcons[index]),
        ),
      ),
    );
  }
}
class UserTitle extends StatelessWidget {
  String title;
  UserTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
    );
  }
}

