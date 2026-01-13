import 'package:url_launcher/url_launcher.dart';

Future<void> openYoutube(String youtubeUrl) async {
  final uri = Uri.parse(youtubeUrl);

  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $youtubeUrl';
  }
}
