import 'package:chatapp/chat_message.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  @override
  State createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {

 final TextEditingController _textController=new TextEditingController();
final List<Chatmessage> _messages= <Chatmessage> [];

 void _handleSubmitted(String text){
   _textController.clear();
  Chatmessage message=new Chatmessage(
    text: text,
  );
  setState(() {
    _messages.insert(0,message);
  });
 }

  Widget _textComposerwidget(){
    return IconTheme(
      data: new IconThemeData(
        color:Colors.blue,
      ),
          child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
               child: new TextField(
          decoration: new InputDecoration.collapsed(
            hintText: "send message"),
            controller:  _textController,
            onSubmitted:_handleSubmitted,       
            )
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(icon: new Icon(Icons.send), onPressed: ()=> _handleSubmitted( _textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),   
                  reverse: true,
                itemBuilder: (_,int index)=>_messages[index],
                itemCount: _messages.length,
              ),
            ),
            new Divider(height: 1.0,),
            new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _textComposerwidget(),
            )
          ],
        );     
  }
}