class HttpTermsAndConditionsResponse {
  final String token;
  final String link;

  HttpTermsAndConditionsResponse({
    required this.token,
    required this.link,
  });

  factory HttpTermsAndConditionsResponse.fromJson(Map<String, dynamic> json) =>
      HttpTermsAndConditionsResponse(
        token: json["token"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "link": link,
      };
}
