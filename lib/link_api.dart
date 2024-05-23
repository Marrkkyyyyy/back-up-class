class AppLink {
  static String server = "https://backupclass.yfcfarmfinds.com";

  // ================================= Auth ====================================
  static String checkEmail = "$server/auth/check_email.php";

  // ================================= Subject ====================================
  static String addSubject = "$server/subject/add_subject.php";
  static String fetchSubject = "$server/subject/fetch_subject.php";
  static String deleteSubject = "$server/subject/delete_subject.php";
  static String updateSubject = "$server/subject/update_subject.php";

  // ================================= Note ====================================
  static String addNote = "$server/note/add_note.php";
  static String fetchNote = "$server/note/fetch_note.php";
  static String deleteNote = "$server/note/delete_note.php";
  static String updateNote = "$server/note/update_note.php";
}
