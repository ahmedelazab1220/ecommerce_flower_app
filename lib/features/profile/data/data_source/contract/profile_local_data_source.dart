abstract interface class ProfileLocalDataSource {
  Future<void> clearAll();
  Future<String?> isGuestUser();
}
