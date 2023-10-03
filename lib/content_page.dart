import 'package:flutter/material.dart';
import 'package:fathiakuis/book_page.dart';

class ContentCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/book1.png',
            height: 375,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan.shade50,
                  foregroundColor: Colors.cyan.shade100,
                  elevation: 2,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const HalamanBuku()));
                },
                child: const Text(
                  'Lihat Buku',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
