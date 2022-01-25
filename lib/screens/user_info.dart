import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:shopifie/consts/colors.dart';

class UserInfo extends StatefulWidget {
  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _value = false;
  ScrollController _scrollController = ScrollController();
  var top=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
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
                    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserListTile('Email', 'Email sub', 0, (){}),
          UserListTile('Phone', '4555', 1, (){}),
          UserListTile('Shipping Address', '', 2, (){}),
          UserListTile('Joined date', 'date', 3, (){}),
          UserListTile('Joined date', 'date', 3, (){}),
          UserListTile('Joined date', 'date', 3, (){}),
          UserListTile('Joined date', 'date', 3, (){}),
          UserListTile('Joined date', 'date', 3, (){}),
          UserListTile('Joined date', 'date', 3, (){}),
          ListTileSwitch(  
	    value: _value,  
		leading: Icon(Icons.wb_sunny),  
		onChanged: (value) {  
		  setState(() {  
			_value = value;  
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
              )
               
            ]
            )
            );
  }
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