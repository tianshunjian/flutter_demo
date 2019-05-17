import 'package:flutter/material.dart';
import 'image_network.dart';
import 'custom_grid.dart';
import 'tap_demo.dart';
import 'delete_item.dart';
import 'pass_params.dart';
import 'animated_list.dart';
import 'appbar_bottom_sample.dart';
import 'appbar_menu.dart';
import 'expansion_tile_sample.dart';
import 'default_tabbar_samplae.dart';
import 'ui_demo.dart';
import 'animation_demos.dart';
import 'hero_demo.dart';
import 'hero_radial.dart';

class Demos extends StatelessWidget {
  final List<String> titles = [
    'Network Image',
    'Grid View',
    'Gesture Detector',
    'Delete Item',
    'Pass Params',
    'AnimatedList',
    'Bottom AppBar',
    'Basic AppBar',
    'ExpansionTile',
    'DefaultTabBar',
    'UI Demo',
    'Animation Demos',
    'Hero Demo',
    'Hero Radial Demo',
  ];

  Widget _buildBody(){
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context,index){
        return ListTile(
          title: Center(
            child: Text(titles[index])
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
          onTap: (){
            if(index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageNetwork())
              );
            } else if(index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomGrid())
              );
            } else if(index == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TapDemo())
              );
            } else if(index == 3) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteItem())
              );
            } else if(index == 4) {
              _navigateAndDisplaySelection(context);
            } else if(index == 5) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAnimatedList())
              );
            } else if(index == 6) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppBarBottomSample())
              );
            } else if(index == 7) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BasicAppBarSample())
              );
            } else if(index == 8) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpansionTileSample())
              );
            } else if(index == 9) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabbedAppBarSample())
              );
            } else if(index == 10) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UIDemo())
              );
            } else if(index == 11) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimationDemos())
              );
            } else if(index == 12) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeroDemo())
              );
            } else if(index == 13) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RadialExpansionDemo())
              );
            }
          },
        );
      },
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>PassParams(buttonCount: 2,))
    );
    
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("$result")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demos List'),
      ),
      body: _buildBody(),
    );
  }
}
