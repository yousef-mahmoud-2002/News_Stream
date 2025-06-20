import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsActions extends StatelessWidget {
  const NewsActions({super.key, required this.newsUrl});

  final String newsUrl;

  void readFullNews() async {
    final uri = Uri.parse(newsUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            readFullNews();
          },
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Read more',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
        IconButton(
          onPressed: () {
            final params = ShareParams(uri: Uri.parse(newsUrl));
            SharePlus.instance.share(params);
          },
          icon: const Icon(Icons.share, color: Colors.blueGrey),
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}
