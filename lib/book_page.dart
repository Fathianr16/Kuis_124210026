import 'package:flutter/material.dart';
import 'package:fathiakuis/detail_page.dart';
import 'package:fathiakuis/data_buku.dart';

class HalamanBuku extends StatelessWidget {
  const HalamanBuku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          'Data Buku',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final DataBuku buku = listBuku[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HalamanDetail(buku: buku),
                ),
              );
            },
            child: Card(
              elevation: 20,
              shadowColor: Colors.cyan,
              child: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                      width: 225,
                      child: Container(
                        child: Image.network(
                          buku.imageLink,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      buku.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
