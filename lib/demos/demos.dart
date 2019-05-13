import 'package:flutter/material.dart';
import 'image_network.dart';

class Demos extends StatelessWidget {
  final List<String> titles = ['Network Image','List2'];

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
                MaterialPageRoute(builder: (BuildContext context) => ImageNetwork())
              );
            }
          },
        );
      },
    );
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
