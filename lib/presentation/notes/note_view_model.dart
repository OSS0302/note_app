import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/presentation/notes/notes_event.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository noteRepository;
  List<Note> _notesList = [];

  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notesList);
  Note? _recentlyDeleteNote;

  NotesViewModel({
    required this.noteRepository,
  });

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await noteRepository.getNotes();
    _notesList = notes;
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await noteRepository.deleteNote(note);
    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_restoreNote() != null) {
      await noteRepository.addNote(_recentlyDeleteNote!);
      _recentlyDeleteNote = null;
      _loadNotes();
    }
  }
}
