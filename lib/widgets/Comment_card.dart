import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  String comments =
      'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  String textt = '';
  @override
  Widget build(BuildContext context) {
    comments.length > 100
        ? textt = comments.substring(0, 100) + " ..."
        : textt = comments;

    print(textt + "<<<<<<<<<<<<<<<");
    return Row(
      children: [
        Container(
          height: 160,
          width: 240,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Column(
              children: [
                ListTile(
                  dense: true,
                  leading: Icon(Icons.person),
                  title: Text('Jane Doe'),
                  subtitle: Text('ndasmu'),
                  trailing: Icon(Icons.star),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(textt),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 24,
        )
      ],
    );
  }
}
