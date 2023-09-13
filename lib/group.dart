import 'dart:io';
import 'package:flutter/material.dart';
import 'SecondScreen.dart';

class kelompok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Data Kelompok",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.calculate,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Calculator_App()),
              );
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "Meet Us!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 50),
                ClipOval(
                  child: Image.asset(
                    "lib/images/Disti.jpg",
                    height: 150,
                    width: 150,
                    fit: BoxFit
                        .cover, // Anda bisa mengganti ini sesuai dengan kebutuhan
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '124200038 - Trisna Adisti',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 40),
                ClipOval(
                  child: Image.asset(
                    "lib/images/Hasna.jpg",
                    height: 150,
                    width: 150,
                    fit: BoxFit
                        .cover, // Anda bisa mengganti ini sesuai dengan kebutuhan
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '124200060 - Hasna Luthfiana Fadhila',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
