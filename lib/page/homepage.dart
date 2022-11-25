import 'dart:ffi';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminderapps/data/database_instance.dart';
import 'package:reminderapps/page/profile_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool? _switch;
  TextEditingController? _judul;
  TextEditingController? _deskripsi;
  String? _date;
  Int? _interval;
  FilePickerResult? _fileNotes;

  Future<void> _addFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['jpg', 'png', 'pdf', 'doc']);
    if (result != null) {
      _fileNotes = result;
      print(_fileNotes);
    }
  }

  DatabaseInstance? _databaseInstance;

  @override
  void initState() {
    super.initState();
    _databaseInstance = DatabaseInstance();
    _databaseInstance!.database();
    _switch = false;
    _judul = TextEditingController();
    _deskripsi = TextEditingController();
  }

  Future<void> _toProfile() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ProfilePage()));
  }

  Future<void> _addNote() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent[100],
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text("HomePage"),
            InkWell(
              onTap: _toProfile,
              child: const Icon(Icons.person_outline_outlined),
            )
          ])),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Add Note",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _judul,
              decoration: InputDecoration(hintText: "Judul"),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _deskripsi!,
              textInputAction: TextInputAction.next,
              maxLines: null,
              minLines: 6,
              decoration: const InputDecoration(hintText: "Deskripsi"),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text("Reminder?"),
                const SizedBox(width: 8),
                CupertinoSwitch(
                    value: _switch!,
                    onChanged: (value) {
                      setState(() {
                        _switch = !_switch!;
                      });
                    }),
              ],
            ),
            const SizedBox(height: 8),
            if (_switch == true)
              DateTimePicker(
                type: DateTimePickerType.dateTime,
                initialValue: DateTime.now().toString(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                dateLabelText: 'Date',
                onChanged: (val) {
                  val = _date!;
                },
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
            const SizedBox(
              height: 8,
            ),
            MaterialButton(
              onPressed: _addFile,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent[100],
                    borderRadius: BorderRadius.circular(16)),
                height: 50,
                width: 100,
                child: const Center(
                    child: Text(
                  "Add File",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
