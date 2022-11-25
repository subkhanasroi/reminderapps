import 'package:date_time_picker/date_time_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool? _switch;
  List<DropdownMenuItem>? _gender;
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _switch = false;
    _gender = [
      const DropdownMenuItem(
        value: 0,
        child: Text("Laki-Laki"),
      ),
      const DropdownMenuItem(
        value: 1,
        child: Text("Perempuan"),
      )
    ];
  }

  Future<void> _changeProfile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent[100],
          title: const Center(child: Text("Profile Page")),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 32,
            ),
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.deepOrangeAccent[100],
                      child: const Icon(Icons.person),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: InkWell(
                      onTap: _changeProfile,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                              color: Colors.blueAccent[100],
                              width: 45,
                              height: 45,
                              child: const Icon(
                                Icons.edit_rounded,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Admin",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Online",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                const Text("Edit Profile ?"),
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
            IgnorePointer(
              ignoring: _switch == true,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Nama Depan"),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Nama Belakang"),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(height: 8),
                  DateTimePicker(
                    type: DateTimePickerType.date,
                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField(
                      hint: const Text("Gender"),
                      items: _gender!,
                      value: _selectedGender,
                      onChanged: (dynamic value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      }),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(height: 8),
                  if (_switch == true)
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueAccent[100],
                            borderRadius: BorderRadius.circular(16)),
                        height: 50,
                        width: 100,
                        child: const Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
