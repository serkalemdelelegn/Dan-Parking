// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ImageRetrive extends StatefulWidget {
  final String? userId;
  const ImageRetrive({Key? key, this.userId}) : super(key: key);

  @override
  State<ImageRetrive> createState() => _ImageRetriveState();
}

class _ImageRetriveState extends State<ImageRetrive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Images")),
      body: StreamBuilder(
        stream: const Stream.empty(),
        // stream: FirebaseFirestore.instance
        //     .collection("users")
        //     .doc(widget.userId)
        //     .collection("images")
        //     .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.docs.length != 0) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  String url = snapshot.data!.docs[index]['downloadURL'];
                  return Image.network(
                    url,
                    height: 300,
                    fit: BoxFit.fitWidth,
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No images found"),
              );
            }
          } else {
            return (const Center(
              child: CircularProgressIndicator(),
            ));
          }
        },
      ),
    );
  }
}
