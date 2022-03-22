import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba_pkm/controller/database_services.dart';
import 'package:coba_pkm/pages/Second_page.dart';
import 'package:coba_pkm/widgets/My_field.dart';
import 'package:coba_pkm/widgets/Profile_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isEdit = false;
  String name = '';
  var userEmail = Get.arguments;
  @override
  void getName() async {
    DocumentSnapshot snapshot =
        await DatabaseService.getUser(userEmail['email']);
    setState(() {
      name = snapshot['name'];
    });

    print("asdasdasd====>>>>>" + snapshot.toString());
  }

  void initState() {
    // TODO: implement initState
    getName();
    super.initState();
  }

  late TextEditingController _controllerName;

  @override
  Widget build(BuildContext context) {
    print("hereeee =====>>>>" + name);
    _controllerName = TextEditingController(text: name);
    var smallText = Theme.of(context).textTheme.bodySmall;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.off(SecondPage());
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.person,
                size: 64,
              ),
            ),
            Text(
              "Your name",
              style: smallText,
            ),
            ProfileField(controller: _controllerName, isEdit: isEdit),
          ],
        ),
      ),
    );
  }
}
