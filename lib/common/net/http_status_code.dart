enum HttpStatusCode {

  ok(value: 200, reasonPhrase: "OK"),
  created(value: 201, reasonPhrase: "Created"),
  accepted(value: 202, reasonPhrase: "Accepted"),

  // NON_AUTHORITATIVE_INFORMATION(
  //     value: 203, reasonPhrase: "Non-Authoritative Information"),

  noContent(value: 204, reasonPhrase: "No Content"),

  // RESET_CONTENT(value: 205, reasonPhrase: "Reset Content"),
  // PARTIAL_CONTENT(value: 206, reasonPhrase: "Partial Content"),
  // MULTI_STATUS(value: 207, reasonPhrase: "Multi-Status"),
  // ALREADY_REPORTED(value: 208, reasonPhrase: "Already Reported"),
  // IM_USED(value: 226, reasonPhrase: "IM Used"),

  // MULTIPLE_CHOICES(value: 300, reasonPhrase: "Multiple Choices"),
  // MOVED_PERMANENTLY(value: 301, reasonPhrase: "Moved Permanently"),
  // FOUND(value: 302, reasonPhrase: "Found"),
  // MOVED_TEMPORARILY(value: 302, reasonPhrase: "Moved Temporarily"),
  // SEE_OTHER(value: 303, reasonPhrase: "See Other"),
  // NOT_MODIFIED(value: 304, reasonPhrase: "Not Modified"),
  // USE_PROXY(value: 305, reasonPhrase: "Use Proxy"),
  // TEMPORARY_REDIRECT(value: 307, reasonPhrase: "Temporary Redirect"),
  // PERMANENT_REDIRECT(value: 308, reasonPhrase: "Permanent Redirect"),

  badRequest(value: 400, reasonPhrase: "Bad Request"),
  unauthorized(value: 401, reasonPhrase: "Unauthorized"),

  paymentRequired(value: 402, reasonPhrase: "Payment Required"),
  forbidden(value: 403, reasonPhrase: "Forbidden"),

  notFound(value: 404, reasonPhrase: "Not Found"),

  methodNotAllowed(value: 405, reasonPhrase: "Method Not Allowed"),

  notAcceptable(value: 406, reasonPhrase: "Not Acceptable"),

  // PROXY_AUTHENTICATION_REQUIRED(
  //     value: 407, reasonPhrase: "Proxy Authentication Required"),
  // REQUEST_TIMEOUT(value: 408, reasonPhrase: "Request Timeout"),
  // CONFLICT(value: 409, reasonPhrase: "Conflict"),
  // GONE(value: 410, reasonPhrase: "Gone"),
  // LENGTH_REQUIRED(value: 411, reasonPhrase: "Length Required"),
  // PRECONDITION_FAILED(value: 412, reasonPhrase: "Precondition Failed"),
  // PAYLOAD_TOO_LARGE(value: 413, reasonPhrase: "Payload Too Large"),
  // REQUEST_ENTITY_TOO_LARGE(
  //     value: 413, reasonPhrase: "Request Entity Too Large"),
  // URI_TOO_LONG(value: 414, reasonPhrase: "URI Too Long"),
  // REQUEST_URI_TOO_LONG(value: 414, reasonPhrase: "Request-URI Too Long"),
  // UNSUPPORTED_MEDIA_TYPE(value: 415, reasonPhrase: "Unsupported Media Type"),
  // REQUESTED_RANGE_NOT_SATISFIABLE(
  //     value: 416, reasonPhrase: "Requested range not satisfiable"),
  // EXPECTATION_FAILED(value: 417, reasonPhrase: "Expectation Failed"),
  // I_AM_A_TEAPOT(value: 418, reasonPhrase: "I'm a teapot"),
  // INSUFFICIENT_SPACE_ON_RESOURCE(
  //     value: 419, reasonPhrase: "Insufficient Space On Resource"),
  // METHOD_FAILURE(value: 420, reasonPhrase: "Method Failure"),
  // DESTINATION_LOCKED(value: 421, reasonPhrase: "Destination Locked"),
  // UNPROCESSABLE_ENTITY(value: 422, reasonPhrase: "Unprocessable Entity"),
  // LOCKED(value: 423, reasonPhrase: "Locked"),
  // FAILED_DEPENDENCY(value: 424, reasonPhrase: "Failed Dependency"),
  // UPGRADE_REQUIRED(value: 426, reasonPhrase: "Upgrade Required"),
  // PRECONDITION_REQUIRED(value: 428, reasonPhrase: "Precondition Required"),
  // TOO_MANY_REQUESTS(value: 429, reasonPhrase: "Too Many Requests"),
  // REQUEST_HEADER_FIELDS_TOO_LARGE(
  //     value: 431, reasonPhrase: "Request Header Fields Too Large"),
  // UNAVAILABLE_FOR_LEGAL_REASONS(
  //     value: 451, reasonPhrase: "Unavailable For Legal Reasons"),

  internalServerError(value: 500, reasonPhrase: "Internal Server Error"),

  // NOT_IMPLEMENTED(value: 501, reasonPhrase: "Not Implemented"),
  // BAD_GATEWAY(value: 502, reasonPhrase: "Bad Gateway"),
  // SERVICE_UNAVAILABLE(value: 503, reasonPhrase: "Service Unavailable"),
  // GATEWAY_TIMEOUT(value: 504, reasonPhrase: "Gateway Timeout"),
  // HTTP_VERSION_NOT_SUPPORTED(
  //     value: 505, reasonPhrase: "HTTP Version not supported"),
  // VARIANT_ALSO_NEGOTIATES(value: 506, reasonPhrase: "Variant Also Negotiates"),
  // INSUFFICIENT_STORAGE(value: 507, reasonPhrase: "Insufficient Storage"),
  // LOOP_DETECTED(value: 508, reasonPhrase: "Loop Detected"),
  // BANDWIDTH_LIMIT_EXCEEDED(
  //     value: 509, reasonPhrase: "Bandwidth Limit Exceeded"),
  // NOT_EXTENDED(value: 510, reasonPhrase: "Not Extended"),
  // NETWORK_AUTHENTICATION_REQUIRED(
  //     value: 511, reasonPhrase: "Network Authentication Required");
  ;

  final int value;
  final String reasonPhrase;

  const HttpStatusCode({required this.value, required this.reasonPhrase});
}
