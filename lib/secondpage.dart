import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_application_6/model.dart';

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> _posts = [];

  Future<void> _fetchPosts() async {
   
    String apiUrl =
        'http://ec2-3-137-201-63.us-east-2.compute.amazonaws.com/api/govardhan/getdata';
    http.Response response = await http.get(Uri.parse(apiUrl));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List<dynamic> postData = jsonResponse['data']['posts'];
    setState(() {
      _posts = postData.map((post) => Post.fromJson(post)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        title:const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 120),
            child: Text(
              'KETY',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Padding(
              padding: EdgeInsets.only(right: 30, left: 20),
              child: Icon(Icons.search),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            Post post = _posts[index];
            if (post.type == 'TEXT') {
              return ListTile(
                title: Text(post.postdata[0]),
                subtitle: Row(
                  children: [
                  const  CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbqWvPN_jr845fHGmwWrU1nDgmQq8HnlkOEg&usqp=CAU"),
                    ),
                    Column(
                      children: [
                        Text(
                          '${post.name} ',
                          style:const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Text(' ${post.time}')
                      ],
                    ),
                  ],
                ),
              );
            } else if (post.type == 'ONE IMG') {
              return ListTile(
                title: Container(
                    width: 370,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(post.postdata[0]))),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    right: 280,
                  ),
                  child: Row(
                    children: [
                    const  CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXCEXrkYNQob9GvPRk5zZJ51WgVjn-XMHiXTH8_ZfwVnXY39d8yn5ug9sQRS1oqmPk8ds&usqp=CAU"),
                      ),
                      Column(
                        children: [
                          Text(
                            '${post.name} ',
                            style:const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('${post.time}')
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (post.type == 'TWO IMG') {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                        width: 370,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(post.postdata[0]))),
                  ),
                const  SizedBox(
                    height: 2,
                  ),
                  Container(
                      width: 370,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(post.postdata[1]))),
                  ListTile(
                    leading: 
                      const  CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTylWvKq8GeITvkCwNsL7kLqEp6Flq-cp_0KA&usqp=CAU"),
                        ),
                       title:  Text('${post.name} - ${post.time}'),
                      
                    
                  ),
                ],
              );
            } else if (post.type == 'THREE IMG') {
              return Column(
                children: [

                          Container(
                              width: 370,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(post.postdata[0]))),
                       
                      SizedBox(height: 2,),
                     
                          Container(
                              width: 370,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(post.postdata[1]))),
                      
                    const  SizedBox(
                        height: 2,
                      ),
                      
                         Container(
                            width: 370,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.network(post.postdata[2]))),
                      
                    
                  
                  ListTile(
                    leading: 
                       const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgwDrNcalxwesBlTB5JSVT6oYc0ICY-2etDQ&usqp=CAU"),
                        ),
                        title: Text('${post.name} - ${post.time}'),
                      
                    
                  ),
                ],
              );
            } else if (post.type == 'FOUR IMG') {
              return Column(
                children: [
                  
                      Container(
                          width: 370,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.network(post.postdata[0]))),
                  
                 const SizedBox(
                    height: 2,
                  ),
                 
                      Container(
                          width: 370,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.network(post.postdata[1]))),

                 const SizedBox(
                    height: 2,
                  ),
                 
                      Container(
                          width: 370,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.network(post.postdata[2]))),

                 const SizedBox(
                    height: 2,
                  ),
                  Container(
                      width: 370,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(post.postdata[3]))),
                  ListTile(
                    leading: 
                       const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOSy3d6DlUG--O9WaVDdKPh-LLdMIO6AXJxw&usqp=CAU"),
                        ),
                      title: Text('${post.name} - ${post.time}',),
                      
                    
                  ),
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
      bottomNavigationBar: Row(
        children: const [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.home),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: FloatingActionButton(
              onPressed:null,
            child: Icon(
              Icons.add,
            ),
            backgroundColor: Colors.orange,
            elevation: 15,
            ),
              // child: Icon(Icons.add)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

