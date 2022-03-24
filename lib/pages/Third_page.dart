import 'package:coba_pkm/widgets/Button_click.dart';
import 'package:coba_pkm/widgets/Comment_card.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tambal Ban Jaya',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Malang',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text('open at 08.00 AM - 22.00 PM')
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          'Start From',
                        ),
                        Text(
                          'Rp 15.000',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                height: 24,
                thickness: 4,
                color: Colors.orange,
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 64,
                ),
                dense: true,
                trailing: Icon(Icons.message),
                title: Text('John Doe'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Tambal Ban, Jl. mandalika, Kec Sukun, Kab Malang, Jawa Timur'),
                    Icon(Icons.star)
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text('Review'),
              Container(
                height: 180,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CommentCard();
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ButtonClick(nameButton: "Pesan", destination: () {}),
              SizedBox(height: 8)
            ],
          ),
        ),
      ),
    );
  }
}
