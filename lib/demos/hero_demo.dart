import 'package:flutter/material.dart';
import 'photo_hero.dart';

class HeroDemo extends StatefulWidget {
  @override
  _HeroDemoState createState() => _HeroDemoState();
}

class _HeroDemoState extends State<HeroDemo> {

  Widget _buildBody(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PhotoHero(
            photo: 'assets/lake.jpg',
            width: 100.0,
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtherHeroPage()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Tap the image',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Demo'),
      ),
      body: _buildBody(),
    );
  }
}

class OtherHeroPage extends StatefulWidget {

  @override
  _OtherHeroPageState createState() => _OtherHeroPageState();
}

class _OtherHeroPageState extends State<OtherHeroPage> {
  Widget _buildBody(){
    return Container(
      color: Colors.white70,
      padding: EdgeInsets.all(16),
      alignment: Alignment.topCenter,
      child: PhotoHero(
        photo: 'assets/lake.jpg',
        width: 300,
        onTap: (){
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Hero'),
      ),
      body: _buildBody(),
    );
  }
}



