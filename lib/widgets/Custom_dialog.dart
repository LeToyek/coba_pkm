import 'package:coba_pkm/widgets/Circle_child.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  Function funcSetuju;
  Function funcKembali;
  CustomDialog({required this.funcSetuju, required this.funcKembali});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 300,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.red,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      'Aktifkan fitur lokasi anda?',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () {
                          funcSetuju();
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(40)),
                          child: Text(
                            'Setuju',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          funcKembali();
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(40)),
                            child: Text(
                              'Kembali',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        width: 16,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: -2,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Text(
                'x',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
