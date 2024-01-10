import 'package:flutter/material.dart';
import 'package:ociuz/controller/registration_controller/regcontroller.dart';
import 'package:ociuz/screens/pdf_screen/pdf_view.dart';
import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pdfWid;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class DataViewScreen extends StatefulWidget {
  const DataViewScreen({super.key});

  @override
  State<DataViewScreen> createState() => _DataViewScreenState();
}

class _DataViewScreenState extends State<DataViewScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController eemaiolcontroller = TextEditingController();
  TextEditingController emunbercontroller = TextEditingController();
  TextEditingController edesigcontroller = TextEditingController();

  int selectedindex = -1;
  @override
  void initState() {
    loadDbData();
    super.initState();
  }

  loadDbData() async {
    await controller.loadDb();
    setState(() {});
  }

  Regcontroller controller = Regcontroller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidates'),
      ),
      body: ListView.builder(
        itemCount: controller.myList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
                height: 70,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 115, 108, 119),
                      Color.fromARGB(255, 51, 46, 48)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(9.0, 7), //(x,y)
                        blurRadius: 9.0,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.myList[index].name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 254, 252, 252)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  controller.Deletename(index);
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                                onTap: () {
                                  selectedindex = index;
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            height: 400,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        height: 40,
                                                      ),
                                                      //title field
                                                      TextField(
                                                        controller:
                                                            namecontroller,
                                                        decoration: InputDecoration(
                                                            hintText: controller
                                                                .myList[index]
                                                                .name,
                                                            border:
                                                                OutlineInputBorder()),
                                                      ),
                                                      TextField(
                                                        controller:
                                                            eemaiolcontroller,
                                                        decoration: InputDecoration(
                                                            hintText: controller
                                                                .myList[index]
                                                                .email,
                                                            border:
                                                                OutlineInputBorder()),
                                                      ),

                                                      TextField(
                                                        controller:
                                                            emunbercontroller,
                                                        decoration: InputDecoration(
                                                            hintText: controller
                                                                .myList[index]
                                                                .mobile
                                                                .toString(),
                                                            border:
                                                                OutlineInputBorder()),
                                                      ),

                                                      TextField(
                                                        controller:
                                                            edesigcontroller,
                                                        decoration: InputDecoration(
                                                            hintText: controller
                                                                .myList[index]
                                                                .designation,
                                                            border:
                                                                OutlineInputBorder()),
                                                      ),

                                                      ElevatedButton(
                                                          onPressed: () {
                                                            controller
                                                                    .myList[
                                                                        selectedindex]
                                                                    .name =
                                                                namecontroller
                                                                    .text;
                                                            // controller.editdata(
                                                            //     index,
                                                            //     Regmodel(
                                                            //       name:
                                                            //           namecontroller
                                                            //               .text,
                                                            //       email:
                                                            //           eemaiolcontroller
                                                            //               .text,
                                                            //       mobile: int.parse(
                                                            //           emunbercontroller
                                                            //               .text),
                                                            //       designation:
                                                            //           edesigcontroller
                                                            //               .text,
                                                            //     ));
                                                            setState(() {});
                                                          },
                                                          child: Text('save')),
                                                    ])));
                                      });
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewScreen(
                                            name: controller.myList[index].name,
                                            email:
                                                controller.myList[index].email,
                                            number:
                                                controller.myList[index].mobile,
                                            designation: controller
                                                .myList[index].designation)));
                              },
                              child: Icon(
                                Icons.print,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}

Future<Uint8List> _createPdf(
  PdfPageFormat format,
) async {
  final pdf = pdfWid.Document(
    version: PdfVersion.pdf_1_4,
    compress: true,
  );
  pdf.addPage(
    pdfWid.Page(
      pageFormat: PdfPageFormat((80 * (72.0 / 25.4)), 600,
          marginAll: 5 * (72.0 / 25.4)),
      //pageFormat: format,
      build: (context) {
        return pdfWid.SizedBox(
          width: double.infinity,
          child: pdfWid.FittedBox(
              child: pdfWid.Column(
                  mainAxisAlignment: pdfWid.MainAxisAlignment.start,
                  children: [
                pdfWid.Text("Follow",
                    style: pdfWid.TextStyle(
                        fontSize: 35, fontWeight: pdfWid.FontWeight.bold)),
                pdfWid.Container(
                  width: 250,
                  height: 1.5,
                  margin: pdfWid.EdgeInsets.symmetric(vertical: 5),
                  color: PdfColors.black,
                ),
                pdfWid.Container(
                  width: 300,
                  child: pdfWid.Text("#30FlutterTips",
                      style: pdfWid.TextStyle(
                        fontSize: 35,
                        fontWeight: pdfWid.FontWeight.bold,
                      ),
                      textAlign: pdfWid.TextAlign.center,
                      maxLines: 5),
                ),
                pdfWid.Container(
                  width: 250,
                  height: 1.5,
                  margin: pdfWid.EdgeInsets.symmetric(vertical: 10),
                  color: PdfColors.black,
                ),
                pdfWid.Text("Lakshydeep Vikram",
                    style: pdfWid.TextStyle(
                        fontSize: 25, fontWeight: pdfWid.FontWeight.bold)),
                pdfWid.Text("Follow on Medium, LinkedIn, GitHub",
                    style: pdfWid.TextStyle(
                        fontSize: 25, fontWeight: pdfWid.FontWeight.bold)),
              ])),
        );
      },
    ),
  );
  return pdf.save();
}
