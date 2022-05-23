import 'package:flutter/material.dart';
import 'package:riverpod_wallet/ui/screens/dashboard/components/history_panel.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';
import 'package:riverpod_wallet/ui/shared/widgets/action_button.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: kPrimaryColor),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Riverpod Wallet'),
            automaticallyImplyLeading: false,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.exit_to_app_rounded),
              )
            ],
          ),
          body: SafeArea(
            bottom: false,
            child: SlidingUpPanel(
              minHeight: MediaQuery.of(context).size.height * 0.4,
              maxHeight: MediaQuery.of(context).size.height,
              parallaxEnabled: true,
              panelBuilder: (controller) => const HistoryPanel(),
              body: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        // user.getBalance();
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        width: double.infinity,
                        child: const Center(
                            child: Text(
                          'PHP 10,000.00',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActionButton(
                        icon: Icons.download_rounded,
                        title: 'Cash-in',
                        // enable: !user.isBalanceLoading,
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => MyQRScreen()));
                        },
                      ),
                      ActionButton(
                        icon: Icons.near_me_outlined,
                        title: 'Transfer',
                        // enable: !user.isBalanceLoading,
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => FundTransferScreen()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
