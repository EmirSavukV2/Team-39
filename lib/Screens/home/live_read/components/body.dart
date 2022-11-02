import 'package:flutter/material.dart';
import 'package:fread/Model/book_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Body extends StatefulWidget {
  final Books books;
  const Body({
    Key? key,
    required this.books,
  }) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PdfViewerController? _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width - 20,
            height: size.height * 1 - 90,
            child: SfPdfViewer.network(
              widget.books.fileUrl!,
              key: _pdfViewerKey,
              controller: _pdfViewerController,
            ),
          ),
        ],
      ),
    );
  }
}
