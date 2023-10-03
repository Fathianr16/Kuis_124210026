import 'package:flutter/material.dart';
import 'package:fathiakuis/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final DataBuku buku;

  const HalamanDetail({super.key, required this.buku});

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isbookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          widget.buku.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: widget.buku.isBookmarked
                ? Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                  ),
            onPressed: () {
              setState(() {
                widget.buku.isBookmarked = !widget.buku.isBookmarked;
              });

              final snackBar = SnackBar(
                content: Text(
                  widget.buku.isBookmarked
                      ? "Berhasil Menambahkan Bookmark"
                      : "Berhasil Menghapus Bookmark",
                ),
                backgroundColor:
                    (widget.buku.isBookmarked) ? Colors.green : Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 300,
                child: Image.network(widget.buku.imageLink),
              ),
              Center(
                child: Text(
                  'Judul Buku:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  widget.buku.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Pengarang:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(widget.buku.author),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Tahun Terbit:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  widget.buku.year.toString(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Negara:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(widget.buku.country),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Bahasa:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(widget.buku.language),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Halaman:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  widget.buku.pages.toString(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchUrl(widget.buku.link);
        },
        child: Icon(Icons.search),
        backgroundColor: Colors.cyan,
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
