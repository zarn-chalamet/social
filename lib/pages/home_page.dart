import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/components/my_drawer.dart';
import 'package:socialapp/components/my_textfield.dart';
import 'package:socialapp/components/post_button.dart';
import 'package:socialapp/firebase/firestore.dart';

class HomePage extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  HomePage({super.key});
  FireStore _firestore = FireStore();
  void addPost() {
    if (textController.text.isNotEmpty) {
      _firestore.addPost(textController.text);
      textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S O C I A L'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                      obscureText: false,
                      controller: textController,
                      hintText: 'Say Something...'),
                ),
                PostButton(onTap: addPost),
              ],
            ),
            StreamBuilder(
                stream: _firestore.getPostsStream(),
                builder: (context, snapshot) {
                  // loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  //get all posts
                  final posts = snapshot.data!.docs;

                  //no data?
                  if (snapshot.data == null || posts.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text("No posts.. Post Something!"),
                      ),
                    );
                  }

                  //return as list
                  return Expanded(
                      child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      //get each individual post
                      final post = posts[index];

                      //get data from each post
                      String message = post['PostMessage'];
                      String userEmail = post['UserEmail'];
                      Timestamp timestamp = post['TimeStamp'];

                      //return as a list tile
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(message),
                          subtitle: Text(userEmail),
                        ),
                      );
                    },
                  ));
                })
          ],
        ),
      ),
    );
  }
}
