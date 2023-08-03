import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataReadingPage extends StatelessWidget {
  const DataReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc("uGYGiUY907ERCgYxveEn").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("${data['player']} ${data['1']} ${data['2']}");
        }

        return Text("loading");
      },
    );
  }
}
