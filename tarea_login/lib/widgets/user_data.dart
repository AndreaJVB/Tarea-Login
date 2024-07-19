class UserData {
  // Lista estática para almacenar los usuarios
  static List<Map<String, String>> users = [];

  // Método para agregar un nuevo usuario
  static void addUser(Map<String, String> user) {
    users.add(user);
  }

  // Método para obtener la lista de usuarios
  static List<Map<String, String>> getUsers() {
    return users;
  }
}
