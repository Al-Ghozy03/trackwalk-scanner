// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_this, import_of_legacy_library_into_null_safe, avoid_print, must_be_immutable, prefer_typing_uninitialized_variables
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/screen/detail_tiket.dart';
import 'dart:ui' as ui;
import '../service/api_service.dart';
// import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class QR extends StatefulWidget {
  String type;
  final id;
  final check;
  final notCheck;
  QR({key, this.type, this.id, this.check, this.notCheck});

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  final qrkey = GlobalKey(debugLabel: "QR");
  Barcode barcode;
  QRViewController controller;
  String hasil;
  Timer timer;
  final arguments = Get.arguments;
  bool isLoading = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  void codeScan() {
    setState(() {
      if (barcode == null) {
        hasil = "Scan A Code";
      } else {
        hasil = barcode?.code;
      }
    });
  }

  @override
  void initState() {
    codeScan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // controller!.pauseCamera();
    controller?.resumeCamera();
    final width = MediaQuery.of(context).size.width;
    final height = Get.height;
    final themeData = Theme.of(context).brightness == ui.Brightness.dark
        ? "DarkTheme"
        : "LightTheme";

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Scan Ticket",
            style: TextStyle(
                color: (hasil == "It's not a ticket" ||
                        hasil == "Not Ticket For This Event")
                    ? Colors.red
                    : (hasil == "This Ticket Is Not Valid")
                        ? Color.fromARGB(255, 255, 193, 59)
                        : (hasil == "Success")
                            ? Color.fromARGB(120, 76, 175, 79)
                            : blueTheme,
                fontWeight: FontWeight.bold,
                fontSize: width / 20),
          ),
          backgroundColor: themeData == "DarkTheme" ? bgDark : Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Iconsax.close_circle5,
              color: (hasil == "It's not a ticket" ||
                      hasil == "Not Ticket For This Event")
                  ? Colors.red
                  : (hasil == "This Ticket Is Not Valid")
                      ? Color.fromARGB(255, 255, 193, 59)
                      : (hasil == "Success")
                          ? Color.fromARGB(120, 76, 175, 79)
                          : blueTheme,
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),
            Positioned(
              bottom: 90,
              child: buildResult(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildControlButtons(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildResult() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: (hasil == "It's not a ticket" ||
                hasil == "Not Ticket For This Event")
            ? Colors.red
            : (hasil == "This Ticket Is Not Valid")
                ? Color.fromARGB(255, 255, 193, 59)
                : (hasil == "Success")
                    ? Color.fromARGB(120, 76, 175, 79)
                    : blueTheme,
      ),
      child: Text(
        "$hasil",
        style: TextStyle(color: Colors.white),
        maxLines: 3,
      ),
    );
  }

  Widget buildControlButtons() {
    final height = Get.height;
    return Container(
      height: height / 12.5,
      // padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(8),
        color: (hasil == "It's not a ticket" ||
                hasil == "Not Ticket For This Event")
            ? Colors.red
            : (hasil == "This Ticket Is Not Valid")
                ? Color.fromARGB(255, 255, 193, 59)
                : (hasil == "Success")
                    ? Color.fromARGB(120, 76, 175, 79)
                    : blueTheme,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: FutureBuilder(
              future: controller?.getFlashStatus(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Icon(
                    snapshot.data ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            onPressed: () async {
              await controller?.toggleFlash();
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrkey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: (hasil == "It's not a ticket" ||
                  hasil == "Not Ticket For This Event")
              ? Colors.red
              : (hasil == "This Ticket Is Not Valid")
                  ? Color.fromARGB(255, 255, 193, 59)
                  : (hasil == "Success")
                      ? Color.fromARGB(120, 76, 175, 79)
                      : blueTheme,
          borderRadius: 11,
          borderWidth: 10,
          borderLength: 20,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );
  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((bar) {
      setState(() {
        this.barcode = bar;
        // print(bar);
        Timer(Duration(microseconds: 1), () {
          future(bar);
          EasyLoading.show(status: 'loading...');
          setState(() {
            isLoading = true;
          });
        });
      });
    });
  }

  // void vibrate() async {
  //   if (await Vibration.hasVibrator()) {
  //     //check if device has vibration feature
  //     Vibration.vibrate(); //500 millisecond vibration
  //   }
  // }

  void future(bar) {
    controller?.pauseCamera();
    Future ticket;
    ticket = ApiService().singleTicket(bar.code).then((value) {
      if (value["status"] == "error") {
        if (mounted) {
          setState(() {
            hasil = "It's not a ticket";
            isLoading = false;
          });
          EasyLoading.dismiss();
        }
        Timer(Duration(seconds: 5), () {
          if (mounted) {
            setState(() {
              hasil = "Scan A Code";
            });
          }
        });
      } else {
        if (value["data"]["WooCommerceEventsBookingDate"] == null ||
            value["data"]["WooCommerceEventsBookingDate"] == "") {
          print(
              'ini adalah datetime $value["data"]["WooCommerceEventsBookingDate"]');
          if (widget.type != "single") {
            if (mounted) {
              setState(() {
                hasil = "This Ticket Is Not Valid";
                isLoading = true;
              });
              EasyLoading.dismiss();
              Timer(Duration(seconds: 5), () {
                if (mounted) {
                  setState(() {
                    hasil = "Scan A Code";
                  });
                }
              });
            }
          } else {
            // log(value["WooCommerceEventsBookingDate"].toString());

            if (value["data"]["WooCommerceEventsProductID"].toString() !=
                widget.id.toString()) {
              setState(() {
                hasil = "Not Ticket For This Event";
                isLoading = true;
              });
              EasyLoading.dismiss();
              Timer(Duration(seconds: 5), () {
                if (mounted) {
                  setState(() {
                    hasil = "Scan A Code";
                  });
                }
              });
            } else {
              // EasyLoading.dismiss();
              if (mounted) {
                setState(() {
                  hasil = "Success";
                  isLoading = true;
                });
                EasyLoading.dismiss();
              }
              Timer(Duration(seconds: 5), () {
                if (mounted) {
                  setState(() {
                    hasil = "Scan A Code";
                  });
                }
              });
              Timer(Duration(microseconds: 1), () {
                // controller!.pauseCamera();
                Get.off(
                    DetailTiket(
                      id: bar.code,
                      type: widget.type,
                      idDetail: widget.id,
                      check: widget.check,
                      notCheck: widget.notCheck,
                    ),
                    transition: Transition.circularReveal,
                    arguments: arguments);
              });
            }
          }
        } else {
          log(value["WooCommerceEventsBookingDate"].toString());

          if (value["data"]["WooCommerceEventsProductID"].toString() !=
              widget.id.toString()) {
            setState(() {
              hasil = "Not Ticket For This Event";
              isLoading = true;
            });
            EasyLoading.dismiss();
            Timer(Duration(seconds: 5), () {
              if (mounted) {
                setState(() {
                  hasil = "Scan A Code";
                });
              }
            });
          } else {
            if (mounted) {
              setState(() {
                hasil = "Success";
                isLoading = true;
              });
              EasyLoading.dismiss();
            }
            Timer(Duration(seconds: 5), () {
              if (mounted) {
                setState(() {
                  hasil = "Scan A Code";
                });
              }
            });
            Timer(Duration(microseconds: 1), () {
              // controller!.pauseCamera();
              Get.off(
                  DetailTiket(
                    id: bar.code,
                    type: widget.type,
                    idDetail: widget.id,
                    check: widget.check,
                    notCheck: widget.notCheck,
                  ),
                  transition: Transition.circularReveal,
                  arguments: arguments);
            });
          }
        }
      }
    });
  }
}
