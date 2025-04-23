import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';

class PaymentWebViewScreen extends StatelessWidget {
  final String initialUrl;
  const PaymentWebViewScreen({super.key, required this.initialUrl});

  @override
  Widget build(BuildContext context) {
    final WebViewController controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                if (url.contains('localhost:3000/allOrders')) {
                  Navigator.of(context).pop(true);
                }
              },
            ),
          )
          ..loadRequest(Uri.parse(initialUrl));

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(false);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.Payment.tr()),
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ),
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
