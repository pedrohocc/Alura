import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.deepPurple,
                height: 300,
                width: 300,
              ),
              Container(
                color: Colors.amber,
                width: 100,
                height: 100,
              )
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.white,
                height: 300,
                width: 300,
              ),
              Container(
                color: Colors.black,
                width: 100,
                height: 100,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.amber,
                width: 30,
                height: 30,
              ),
              Container(
                color: Colors.blueAccent,
                width: 30,
                height: 30,
              ),
              Container(
                color: Colors.redAccent,
                width: 30,
                height: 30,
              )
            ],
          ),
          Container(
            width: 500,
            color: Colors.white,
            child: const Text(
              "ola",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("data"))
        ],
      ),
    );
  }
}
