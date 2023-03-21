import 'package:flutter/material.dart';
import 'package:socialmedia/api/apiservice.dart';
import 'package:socialmedia/model/postmodel.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  ApiServie servie = ApiServie();
  List<Post> postData = [];
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    loadPostData();
  }

  loadPostData() async {
    postData = await servie.getPostInfo();
    setState(() {
      postData = postData;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: isloading
              ? Center(
                  child: Container(
                      width: 100,
         height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Skateboarding.gif"),
                        fit: BoxFit.cover),
                  ),
                ))
              : ListView.builder(
                  itemCount: postData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.all(15),
                      elevation: 10,
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
                            title: Text(postData[index].title ?? ""),
                            subtitle: Text(postData[index].body ?? ""),
                            leading: const Icon(Icons.feed),
                          ),
                        ],
                      ),
                    );
                  })),
    );
  }
}
