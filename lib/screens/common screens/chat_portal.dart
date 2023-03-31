import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: use_key_in_widget_constructors
class ChatsHomeScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChatsHomeScreenState createState() => _ChatsHomeScreenState();
}

class _ChatsHomeScreenState extends State<ChatsHomeScreen> {
  late final String _currentUserId;
  late Stream<QuerySnapshot> _chatsStream;

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.instance.currentUser!.uid;
    _chatsStream = FirebaseFirestore.instance
        .collection('chats')
        .where('users', arrayContains: _currentUserId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.075,
      ),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Chats',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
            backgroundColor: Colors.black,
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: _chatsStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('No chats found'),
                );
              }
              final chats = snapshot.data!.docs;
              return ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  final chatId = chat.id;
                  final users = chat['users'] as List<dynamic>;
                  final otherUserId =
                      users.firstWhere((userId) => userId != _currentUserId);
                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(otherUserId)
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      final user = snapshot.data!;
                      final userName = user['name'];
                      final userImageUrl = user['photo'];
                      return ListTile(
                        style: ListTileStyle.list,
                        minVerticalPadding: 20,
                        minLeadingWidth: 15,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.06,
                            top: 15),
                        leading: userImageUrl != null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(userImageUrl),
                                maxRadius: 35,
                              )
                            : CircleAvatar(
                                child: Text(userName[0]),
                              ),
                        title: Text(
                          userName,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        subtitle: Text(
                          chat['lastmessage'] ?? '',
                          textAlign: TextAlign.start,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                  chatId: chatId,
                                  currentUserId: _currentUserId,
                                  username: userName,
                                  userimage: userImageUrl),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(0, 113, 227, 1),
            onPressed: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (context) => const NewChatScreen(),
                ),
              )
                  .then((value) {
                setState(() {});
              });
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String chatId;
  final String currentUserId;
  final String username;
  final String userimage;

  const ChatScreen(
      {super.key,
      required this.chatId,
      required this.currentUserId,
      required this.username,
      required this.userimage});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Stream<QuerySnapshot> _messagesStream;
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messagesStream = FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final messageText = _messageController.text.trim();
    if (messageText.isEmpty) {
      return;
    }
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatId)
        .collection('messages')
        .add({
      'senderId': widget.currentUserId,
      'text': messageText,
      'timestamp': FieldValue.serverTimestamp(),
    });

    var latestMessage = await FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    var latestTitle = latestMessage.docs[0].data()['text'];

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatId)
        .update({'lastmessage': latestTitle});

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.userimage),
                maxRadius: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06),
                child: Text(
                  widget.username,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _messagesStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final messages = snapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final senderId = message['senderId'];
                    final isMe = senderId == widget.currentUserId;
                    return Container(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 4.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: isMe
                              ? const Color.fromARGB(255, 0, 92, 168)
                              : const Color.fromARGB(255, 98, 98, 98),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          message['text'],
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 30,
              top: 15,
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(150, 82, 82, 82),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _messageController,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  late final String _currentUserId;
  late Stream<QuerySnapshot> _usersStream;

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.instance.currentUser!.uid;
    _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Chat',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final users = snapshot.data!.docs;
          return Container(
            margin: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final userId = user.id;
                if (userId == _currentUserId) {
                  return Container();
                }
                final userName = user['name'];
                final userImageUrl = user['photo'];
                final type = user['class'];
                return ListTile(
                  selectedTileColor: Colors.grey,
                  contentPadding:
                      const EdgeInsets.only(top: 10, bottom: 10, left: 30),
                  leading: userImageUrl != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(userImageUrl),
                        )
                      : CircleAvatar(
                          child: Text(userName[0]),
                        ),
                  title: Text(
                    userName,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(type),
                  onTap: () async {
                    // Check if a chat already exists
                    final existingChatsQuery = await FirebaseFirestore.instance
                        .collection('chats')
                        .where('users', arrayContains: _currentUserId)
                        .get();
                    if (existingChatsQuery.docs.isNotEmpty) {
                      final chatId = existingChatsQuery.docs.first.id;
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            chatId: chatId,
                            currentUserId: _currentUserId,
                            username: userName,
                            userimage: userImageUrl,
                          ),
                        ),
                      );
                    } else {
                      // Create a new chat
                      final chatDoc = await FirebaseFirestore.instance
                          .collection('chats')
                          .add({});
                      final chatId = chatDoc.id;
                      final chatUsers = [_currentUserId, userId];
                      final chatData = {
                        'users': chatUsers,
                        'lastMessage': null,
                        'timestamp': FieldValue.serverTimestamp(),
                      };
                      await chatDoc.update(chatData);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            chatId: chatId,
                            currentUserId: _currentUserId,
                            userimage: userImageUrl,
                            username: userName,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
