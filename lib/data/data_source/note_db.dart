import 'package:note_app/domain/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NoteDB {
  Database db;

  NoteDB(this.db);

  // 아이디를 통해서
  Future<Note?> getNoteById(int id) async {
    // select * from note where id = 1;
    // map는 제이슨 형태다.
    final List<Map<String, dynamic>> mappings = await db.query(
      'note',
      where: 'id = ?',
      whereArgs: [id], // id에 들어갈 값을 리스트를 맵핑을 해준다.
    );

    if (mappings.isNotEmpty) {
      return Note.fromJson(mappings.first);
    } else {
      return null;
    }
  }

  // 노트 리스트 가져오기
  Future<List<Note>> getNotes() async {
    final mappings = await db.query('note');
    return mappings.map((e) => Note.fromJson(e)).toList(); // 노트 리스트 형태로 리턴
  }

  // 노트 추가하기
  Future<void> addNote(Note note) async {
    await db.insert('note', note.toJson());
  }

  // 노트 수정하기
  Future<void> updateNote(Note note) async {
    await db.update('note', note.toJson(), where: 'id =?', whereArgs: [note.id],);
  }
  // 노트 삭제
  Future<void> deleteNote(Note note) async {
    await db.delete('note',where: 'id = ?', whereArgs: [note.id]);
  }
}