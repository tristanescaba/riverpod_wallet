import 'package:flutter/material.dart';
import 'package:riverpod_wallet/ui/screens/cash_in/pages/cash_in_page1.dart';
import 'package:riverpod_wallet/ui/screens/cash_in/pages/cash_in_page2.dart';
import 'package:riverpod_wallet/ui/screens/cash_in/pages/cash_in_page3.dart';
import 'package:riverpod_wallet/ui/screens/cash_in/pages/cash_in_page4.dart';

class CashInScreen extends StatefulWidget {
  const CashInScreen({Key? key}) : super(key: key);

  @override
  State<CashInScreen> createState() => _CashInScreenState();
}

class _CashInScreenState extends State<CashInScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash-in'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          CashInPage1(pageController: _pageController),
          CashInPage2(pageController: _pageController),
          CashInPage3(pageController: _pageController),
          CashInPage4(pageController: _pageController),
        ],
      ),
    );
  }
}
