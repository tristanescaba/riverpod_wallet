import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wallet/ui/screens/dashboard/components/account_balance_view.dart';
import 'package:riverpod_wallet/ui/screens/dashboard/components/dashboard_menu_view.dart';
import 'package:riverpod_wallet/ui/screens/dashboard/components/history_panel_view.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<bool> _showLogoutDialog() async {
      return (await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.black87, fontSize: 12.0),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: kPrimaryColor, fontSize: 12.0),
                  ),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _showLogoutDialog,
      child: Stack(
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
                  onPressed: _showLogoutDialog,
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
                panelBuilder: (controller) => const HistoryPanelView(),
                body: Column(
                  children: const [
                    AccountBalanceView(),
                    MenuView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
