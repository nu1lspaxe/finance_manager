import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio dio;
  bool _isInitialized = false;

  factory DioClient() => _instance;
  
  DioClient._internal() {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      // Load the certificates from the root bundle
      ByteData caCert = await rootBundle.load('certs/ca.pem');
      ByteData clientCert = await rootBundle.load('certs/cert.pem');
      ByteData clientKey = await rootBundle.load('certs/key.pem');

      // Create a SecurityContext with the loaded certificates
      SecurityContext context = SecurityContext(withTrustedRoots: true);
      context.setTrustedCertificatesBytes(caCert.buffer.asUint8List());
      context.useCertificateChainBytes(clientCert.buffer.asUint8List());
      context.usePrivateKeyBytes(clientKey.buffer.asUint8List());

      // Create a Dio instance with the custom HttpClientAdapter
      dio = Dio();
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          return HttpClient(context: context);
        },
      );

      // Add interceptors for logging
      dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: false,
      ));

      _isInitialized = true;
    } catch (e) {
      throw Exception('Failed to initialize Dio: $e');
    }
  }

  Future<Dio> getDio() async {
    if (!_isInitialized) {
      await _initialize();
    }
    return dio;
  }
}
