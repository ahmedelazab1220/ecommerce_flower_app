import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../core/utils/datasource_excution/api_constants.dart';
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
                if (url.contains(ApiConstants.paymentRoute)) {
                  Navigator.of(context).pop(true);
                }
              },
            ),
          )
          ..loadRequest(Uri.parse(initialUrl));

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          Navigator.of(context).pop(false);
        }
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
