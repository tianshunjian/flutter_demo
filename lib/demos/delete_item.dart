import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DeleteItem extends StatefulWidget {
  @override
  _DeleteItemState createState() => _DeleteItemState();
}

class _DeleteItemState extends State<DeleteItem> {

  final List<String> items = new List<String>.generate(50, (i) => 'item$i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete List'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context){
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context,index){
        final item = items[index];
        return Dismissible(
          key: Key(item),
          onDismissed: (direction){
            items.remove(item);
            Scaffold.of(context).showSnackBar(
              new SnackBar(content: Text('$item dismissed'))
            );
          },
          background: Container(
            color: Colors.red,
            child: Center(child: Text('delete')),
          ),
          child: ListTile(
            title: Text(item),
          ),
        );
      },
    );
  }
}
