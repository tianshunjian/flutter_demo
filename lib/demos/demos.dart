import 'package:flutter/material.dart';
import 'image_network.dart';
import 'custom_grid.dart';
import 'tap_demo.dart';
import 'delete_item.dart';
import 'pass_params.dart';

class Demos extends StatelessWidget {
  final List<String> titles = [
    'Network Image',
    'Grid View',
    'Gesture Detector',
    'Delete Item',
    'Pass Params'
  ];

  Widget _buildBody(){
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context,index){
        return ListTile(
          title: Text(titles[index]),
          onTap: (){
            if(index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageNetwork())
              );
            } else if(index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomGrid() )
              );
            } else if(index == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TapDemo() )
              );
            } else if(index == 3) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteItem() )
              );
            } else if(index == 4) {
              _navigateAndDisplaySelection(context);
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
