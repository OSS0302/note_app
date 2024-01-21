import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/presentation/colors.dart';
import 'package:note_app/presentation/notes/widget/note_item.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
        ],
        title: const Text(
          '나의 노트 ',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            NoteItem(
              note: Note(
                  title: 'title1',
                  content: 'content1',
                  color: lime.value,
                  timestamp: 1),
            ),
            NoteItem(
              note: Note(
                  title: 'title2',
                  content: 'content2',
                  color: blue.value,
                  timestamp: 2),
            )
          ],
        ),
      ),
    );
  }
}
