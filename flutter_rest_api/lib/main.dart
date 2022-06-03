import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/user_model.dart';
import 'package:flutter_rest_api/service/user_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  UserService _service = UserService();
  bool? isLoading;
  List<userModelData?> users = [];
  @override
  void initState() {
    super.initState();
    _service.fetchusers().then((value) {
      if (value != null && value.data != null) {
        setState(() {
          users = value.data!;
          isLoading = true;
        });
      } else {
        setState(() {
          
          isLoading =false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Material App Bar"),
        ),
        body:isLoading == null ? const Center(child: CircularProgressIndicator(),) : isLoading == true ? ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(users[index]!.firstName! + users[index]!.lastName!),
                subtitle: Text(users[index]!.email!),
                leading: (CircleAvatar(
                  backgroundImage: NetworkImage(users[index]!.avatar!),
                )),
              );
            }) : const Center( 
              child: Text("Bir Sorun Oluştu"),
            )
      ),
    );
  }
}
