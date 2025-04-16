abstract interface class ProfileLocalDataSource {
  Future<void> clearAll();
  Future<bool> isGuestUser();
}
