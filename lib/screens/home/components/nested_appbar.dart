import 'package:flutter/material.dart';

class FirstFloatingAppBar extends StatelessWidget {
  const FirstFloatingAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 50,
      backgroundColor: Colors.black87,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.white)),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded, color: Colors.white)),
      ],
      title: Row(
        children: [
          Text(
            "Bonjour",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 25,
            width: 25,
            child: Image.asset("assets/icons/welcome.png"),
          )
        ],
      ),
      automaticallyImplyLeading: false,
      expandedHeight: 25,
      pinned: false,
      floating: true,
      snap: false,
    );
  }
}
