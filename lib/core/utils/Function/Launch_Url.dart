import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> LauchCustomUrl(context, String Url) async {
  Uri url = Uri.parse(Url);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Can Not Launch $Url")));
  }
}
