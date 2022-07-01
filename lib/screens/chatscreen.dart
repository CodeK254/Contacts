// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  TextEditingController message = TextEditingController();

  _tryAbout(){
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 12, top: 0),
        child: Text(
          'Hey there, I am using try chat...',
          style: TextStyle(
            fontFamily: 'Rancho',
            fontSize: 18,
            letterSpacing: 1.2,
            color: Colors.white,
          )
        ),
      ),
    );
  }

 _messageInput(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.5,
                      color: Colors.grey,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.teal[800]
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: TextFormField(
                        controller: message,
                        decoration: InputDecoration(hintText: 'Send a message...'),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){}, 
                      child: Icon(
                        Icons.attach_file_outlined,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: GestureDetector(
                        onTap: (){}, 
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FloatingActionButton(onPressed: (){},backgroundColor: Colors.teal,child: Icon(Icons.mic_rounded,color: Colors.black,),),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/dp2.jpg'),
              radius: 25,
            ),
            SizedBox(width: 30,),
            Text(
              'Try Chat',
              style: TextStyle(
                fontFamily: 'Rancho',
                fontSize: 25,
                letterSpacing: 1.5,
                color: Colors.white,
              )
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tryAbout(),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, int index) {
                return index % 2 == 0 ? Padding(
                  padding: const EdgeInsets.all(12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.87,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.teal,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'This must be hard mazee, long time no see. For the sake of these souls...',
                            style: TextStyle(
                              fontFamily: 'Rancho',
                              fontSize: 15,
                              letterSpacing: 1.2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                :
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.87,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                            )
                          ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Text(
                            'This must be hard mazee, long time no see. For the sake of these souls...',
                            style: TextStyle(
                              fontFamily: 'Rancho',
                              fontSize: 15,
                              letterSpacing: 1.2,
                              color: Colors.teal,
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
          _messageInput(),
        ],
      ),
    );
  }
}

// create a class
