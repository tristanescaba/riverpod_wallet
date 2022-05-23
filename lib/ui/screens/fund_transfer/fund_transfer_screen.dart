import 'package:flutter/material.dart';
import 'package:riverpod_wallet/ui/screens/fund_transfer/pages/fund_transfer_page1.dart';
import 'package:riverpod_wallet/ui/screens/fund_transfer/pages/fund_transfer_page2.dart';
import 'package:riverpod_wallet/ui/screens/fund_transfer/pages/fund_transfer_page3.dart';
import 'package:riverpod_wallet/ui/screens/fund_transfer/pages/fund_transfer_page4..dart';

class FundTransferScreen extends StatefulWidget {
  const FundTransferScreen({Key? key}) : super(key: key);

  @override
  State<FundTransferScreen> createState() => _FundTransferScreenState();
}

class _FundTransferScreenState extends State<FundTransferScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fund Transfer'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          FundTransferPage1(pageController: _pageController),
          FundTransferPage2(pageController: _pageController),
          FundTransferPage3(pageController: _pageController),
          FundTransferPage4(pageController: _pageController),
        ],
      ),
    );
  }
}
