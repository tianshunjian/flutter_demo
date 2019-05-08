import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> with TickerProviderStateMixin {
  final TextEditingController _controller = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isComposing = false;

  Widget _buildTextComposer(){
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _controller,
                onChanged: (String text){
                  setState(() {
                    _isComposing = text.length > 0 ? true : false;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Send a message',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_controller.text)
                      : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text){
    _controller.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200),
      ),
    );
    setState(() {
      _messages.insert(0, message);
      _isComposing = false;
    });
    message.animationController.forward();
  }

  Widget _buildBody(){
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: EdgeInsets.all(8),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(height: 1,),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _buildTextComposer(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    for (ChatMessage m in _messages){
      m.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FriendlyChat'),
      ),
      body: SafeArea(child: _buildBody()),
    );
    return MaterialApp(
      title: 'chat',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FriendlyChat'),
        ),
        body: SafeArea(child: _buildBody()),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final AnimationController animationController;
  final String _name = 'Stephen';
  final String text;
  ChatMessage({
    this.text,
    this.animationController
  });

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut
      ),
      axisAlignment: 0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                child: Text(_name[0]),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _name,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}