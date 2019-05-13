import 'package:flutter/material.dart';

class PassParams extends StatelessWidget {
  final int buttonCount;
  PassParams({this.buttonCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pass Params'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildButton(context),
        ),
      ),
    );
  }

  List<Widget> _buildButton(BuildContext context){
    final List<Padding> buttons = List<Padding>.generate(buttonCount, (i){
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context, 'button$i');
          },
          child: Text('button$i'),
        ),
      );
    });
    return buttons;
  }
}
