import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String clientId;
  final String redirectUri;
  final String scopes;
  final String codeChallenge;

  const WebViewPage({
    super.key,
    required this.clientId,
    required this.redirectUri,
    required this.scopes,
    required this.codeChallenge,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    final authUrl = Uri.https('accounts.spotify.com', '/authorize', {
      'client_id': widget.clientId,
      'response_type': 'code',
      'redirect_uri': widget.redirectUri,
      'scope': widget.scopes,
      'code_challenge_method': 'S256',
      'code_challenge': widget.codeChallenge,
      'show_dialog': 'true',
    }).toString();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            final url = request.url;

            if (url.startsWith(widget.redirectUri)) {
              final uri = Uri.parse(url);
              final code = uri.queryParameters['code'];
              final error = uri.queryParameters['error'];

              if (code != null) {
                Navigator.of(context).pop(code);
              } else if (error != null) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Error de autenticación'),
                    content: Text('Ocurrió un error: $error'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                            ..pop() // cierra el diálogo
                            ..pop(); // cierra la WebView y retorna null
                        },
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              } else {
                Navigator.of(context).pop();
              }

              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(authUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
