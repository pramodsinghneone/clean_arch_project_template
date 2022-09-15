enum ENVIRONMENT { dev, staging, production }

class BaseClient {
  static String baseURL = "";
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static String getBaseUrl(ENVIRONMENT environment) {
    switch (environment) {
      case ENVIRONMENT.dev:
        baseURL = "https://reqres.in";
        break;
      case ENVIRONMENT.staging:
        baseURL = "https://reqres.in";
        break;
      case ENVIRONMENT.production:
        baseURL = "https://reqres.in";
        break;
      default:
        baseURL = "https://reqres.in";
    }
    return baseURL;
  }

  static Map<String, String> getHeaders() {
    headers = {'Content-Type': 'application/json'};
    return headers;
  }
}
