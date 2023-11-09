import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class WebRepository {
  final Uri _url = Uri.parse("https://www.google.com.br/");

  Future<void> lounchURL() async {
    await InAppBrowser.openWithSystemBrowser(url: _url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(
        _url,
      );
    } else {
      await InAppBrowser.openWithSystemBrowser(url: _url);
    }
  }
}
