import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:scaning/scaning/ui/screens/product_reg_screen.dart';
import 'package:scaning/scaning/ui/screens/history_screen.dart';
import 'package:scaning/scaning/ui/widget/neu_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  String _scanBarcode = 'Adika';
  int selectindex = 0;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<void> scanBaecode() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Выйти', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Ошибка.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      int aaa = int.tryParse(_scanBarcode) ?? 0;
      if (aaa <= 0) {
        Get.snackbar("Ошибка", "Сканируйте верный штрих код",
            margin: const EdgeInsets.all(16),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red[100],
            colorText: Colors.black87,
            icon: const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
            ));
      } else {
        Get.to(ProductRegScreen(number: aaa));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: boxColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeuButton(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 23, horizontal: 16),
                color: boxColor2,
                title: 'Сканировать',
                onTab: scanBaecode,
              ),
              const SizedBox(
                height: 30,
              ),
              NeuButton(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 23, horizontal: 16),
                color: boxColor2,
                title: 'История товаров',
                onTab: () => Get.to(const HistoryScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color boxColor = const Color(0xFFEFF3FF);
Color boxColor2 = const Color(0xFFE5EAFF);
Color black = Colors.black;
Color red = const Color.fromARGB(255, 255, 222, 227);
Color kDarkBlueColor = const Color(0xFF053149);
