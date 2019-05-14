import 'package:flutter/material.dart';

class AppBarBottomSample extends StatefulWidget {
  @override
  _AppBarBottomSampleState createState() => _AppBarBottomSampleState();
}

class _AppBarBottomSampleState extends State<AppBarBottomSample> with SingleTickerProviderStateMixin {
  TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: choices.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta){
    final int newIndex = _tabController.index + delta;
    if(newIndex < 0 || newIndex >= _tabController.length){
      return;
    }
    _tabController.animateTo(newIndex);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Bottom'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_back),
              tooltip: 'Previous choice',
              onPressed: (){
                _nextPage(-1);
              }
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            tooltip: 'Next choice',
            onPressed: (){
              _nextPage(1);
            },
          ),
        ],
        bottom: PreferredSize(
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              height: 48,
              alignment: Alignment.center,
              child: TabPageSelector(controller: _tabController,),
            ),
          ),
          preferredSize: Size.fromHeight(48),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: choices.map((Choice choice){
          return Padding(
            padding: EdgeInsets.all(16),
            child: ChoiceCard(choice: choice,),
          );
        }).toList(),
      ),
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

