enum FetchError {
  /// The server returned an invalid or malformed response.
  /// The response body may contain clues as to what went wrong.
  /// See the server's logs for more information.

  badRequest('badRequest'),

  /// The server returned 401 Unauthorized.
  /// The client must authenticate itself to gain access to the resource.

  unauthorized('unauthorized'),

  /// The server returned 403 Forbidden.
  /// The client does not have access to the requested resource.

  forbidden('forbidden'),

  /// The server returned 404 Not Found.
  /// The requested resource could not be found but may be
  ///  available again in the future.
  /// Subsequent requests by the client are permissible.

  notFound('notFound'),

  /// The server returned 405 Method Not Allowed.
  /// The request method is known but not allowed
  /// for the requested resource.

  methodNotAllowed('methodNotAllowed'),

  /// The server returned a 500 Internal Server Error.
  /// The server met an unexpected condition which prevented
  /// it from fulfilling the request.

  internalServerError('internalServerError'),

  /// The server returned a 501 Not Implemented.
  /// The server does not support the functionality
  /// required to fulfill the request.

  notImplemented('notImplemented'),

  /// The server returned a 502 Bad Gateway.
  /// The server, while acting as a gateway or proxy, received an
  ///  invalid response from the upstream server it accessed in
  ///  attempting to fulfill the request.
  /// This is often the result of a server-side bug.
  /// The client should not retry the request.
  /// The client should continue to use the original request and not repeat it.

  badGateway('badGateway'),

  /// The server returned a 503 Service Unavailable.
  /// The server is currently unable to handle the request due to
  ///  a temporary overload or scheduled maintenance,
  /// which will likely be alleviated after some delay.
  /// The client should either retry the request after a delay
  ///  or try again later.
  /// If the client keeps retrying the request, it may fail again.
  /// The client should not retry the request until it is clear that
  ///  the server is up and running again.

  serviceUnavailable('serviceUnavailable'),

  /// The server returned a 504 Gateway Timeout.
  /// The server, while acting as a gateway or proxy,
  /// did not receive a timely response from the upstream server specified
  ///  by the URI (e.g. HTTP, FTP, LDAP) or from a local server.
  /// The client should not retry the request.
  /// The client should continue to use the original request and not repeat it.
  /// This is often used to detect a network timeout
  ///  that the client may have caused.

  gatewayTimeout('gatewayTimeout'),

  /// The server returned a 505 HTTP Version Not Supported.
  /// The server does not support the HTTP protocol version used in the request.
  /// The client should use an alternate protocol such as HTTP/2.
  /// The client should continue to use the original request and not repeat it.
  /// This is often used to detect a client that is not using a
  ///  supported protocol.

  httpVersionNotSupported('httpVersionNotSupported'),

  /// The server returned a 511 Network Authentication Required.
  /// The client must authenticate itself to gain access to the resource.
  /// The client should continue to use the original request and not repeat it.
  /// This is often used to detect a client that is not using
  ///  a supported protocol.
  /// The client should not retry the request.

  networkAuthenticationRequired('networkAuthenticationRequired'),

  /// The server returned a 599 Unknown Error.
  /// The server met an unexpected condition which prevented it from
  /// fulfilling the request.
  /// The client should not retry the request.
  /// The client should continue to use the original request and not repeat it.

  unknownError('unknownError'),

  // on socket error  (e.g. connection refused, no internet connection)
  socketError('socketError'),

  // on timeout error (e.g. connection timeout)
  timeoutError('timeoutError'),

  // on wrong json format
  formatError('formatError'),

  // httpError,
  httpError('httpError');

  // convert error code to string
  const FetchError(this.code);
  final String code;

  // convert string to error code
  static FetchError fromCode(String code) {
    return FetchError.values.firstWhere(
      (e) => e.code == code,
      orElse: () => unknownError,
    );
  }
}
