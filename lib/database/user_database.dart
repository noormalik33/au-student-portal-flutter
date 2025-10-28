// ============================================
// database/user_database.dart
// ============================================

// User Database (In-memory storage)
class UserDatabase {
  static final Map<String, Map<String, String>> _users = {};

  static bool registerUser(String studentId, String password, String name) {
    if (_users.containsKey(studentId)) {
      return false; // User already exists
    }
    _users[studentId] = {'password': password, 'name': name};
    return true;
  }

  static bool loginUser(String studentId, String password) {
    if (!_users.containsKey(studentId)) {
      return false; // Account doesn't exist
    }
    return _users[studentId]!['password'] == password;
  }

  static bool userExists(String studentId) {
    return _users.containsKey(studentId);
  }

  static String? getUserName(String studentId) {
    return _users[studentId]?['name'];
  }
}
