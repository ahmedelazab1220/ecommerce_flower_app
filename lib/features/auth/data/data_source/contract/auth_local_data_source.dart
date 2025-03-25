abstract class AuthLocalDataSource {
  Future<void> saveToken(String key, String value);

  Future<String?> getToken(String key);

  Future<void> deleteToken(String key);
}
