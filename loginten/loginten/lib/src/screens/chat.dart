
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Add expanded widget containing a list of messages
          Expanded(child: StreamBuilder(
          //  stream: FirebaseFirestore.instance.collection('messages').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data.docs[index].get('message')),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),

          // Add the input field and send button
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

              ],
            ),
          ),
        ],
      ),
    );
  }



  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}