import 'package:flutter/material.dart';

class SecondPinedAppBar extends StatelessWidget {
  const SecondPinedAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        toolbarHeight: 45,
        backgroundColor: Colors.black87,
        expandedHeight: 15,
        automaticallyImplyLeading: false,
        elevation: 10.0,
        pinned: true,
        title: Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 35,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[850]),
                  child: Center(
                    child: Text(
                      "Music",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )),
              SizedBox(
                width: 35,
              ),
              Container(
                  height: 35,
                  //width: 130,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[850]),
                  child: Center(
                    child: Text(
                      "Podcast & emissions",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )),
              Spacer()
            ],
          ),
        ));
  }
}
