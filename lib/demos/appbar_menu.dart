import 'package:flutter/material.dart';

class BasicAppBarSample extends StatefulWidget {
  @override
  _BasicAppBarSample createState() => _BasicAppBarSample();
}

class _BasicAppBarSample extends State<BasicAppBarSample> {
  Choice _selectedChoice = choices[0];
  
  void _select(Choice choice){
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic AppBar'),
        actions: <Widget>[
          IconButton(
              icon: Icon(choices[0].icon),
              tooltip: 'Previous choice',
              onPressed: (){
                _select(choices[0]);
              }
          ),
          IconButton(
            icon: Icon(choices[1].icon),
            tooltip: 'Next choice',
            onPressed: (){
              _select(choices[1]);
            },
          ),
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context){
              return choices.skip(2).map((Choice c){
                return PopupMenuItem<Choice>(
                  value: c,
                  child: Text(c.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ChoiceCard(choice: _selectedChoice,),
      )
    );
  }
}

class Choice{
  const Choice({this.title,this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const<Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  final Choice choice;
  ChoiceCard({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128, color: textStyle.color,),
            Text(choice.title, style: textStyle,),
          ],
        ),
      ),
    );
  }
}

