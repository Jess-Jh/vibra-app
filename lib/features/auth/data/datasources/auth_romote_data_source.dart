import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vibra/core/utils/pkce_utils.dart';
import 'package:vibra/features/auth/presentation/pages/widgets/web_view.dart';

class AuthRemoteDataSource {
  final String clientId = '10a90e3bfbbb49b7ac3a2d0c7c4deaa6';
  final String redirectUri = 'vibra://callback';
  final String scopes =
      'user-read-email user-read-private user-library-modify user-library-read user-top-read';

  Future<String> authenticate(BuildContext context) async {
    final codeVerifier = PkceUtils.generateCodeVerifier();
    final codeChallenge = PkceUtils.generateCodeChallenge(codeVerifier);

    final code = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => WebViewPage(
          clientId: clientId,
          redirectUri: redirectUri,
          scopes: scopes,
          codeChallenge: codeChallenge,
        ),
      ),
    );

    if (code == null) throw Exception('No se obtuvo el código de autorización');

    final response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUri,
        'client_id': clientId,
        'code_verifier': codeVerifier,
      },
    );

    final data = json.decode(response.body);
    if (response.statusCode == 200 && data['access_token'] != null) {
      return data['access_token'];
    } else {
      throw Exception(
        'Error al obtener el token: ${data['error_description'] ?? data['error']}',
      );
    }
  }
}
