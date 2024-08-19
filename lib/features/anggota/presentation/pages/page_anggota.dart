import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class PageAnggota extends StatefulWidget {
  @override
  _PageAnggotaState createState() => _PageAnggotaState();
}

class _PageAnggotaState extends State<PageAnggota> {
  List<Widget> _members = [MemberInputField(hintText: 'Nama')];

  void _addMemberField() {
    setState(() {
      _members.add(MemberInputField(hintText: 'Nama'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Anggota'),
      ),
      body: KeyboardAvoider(
        autoScroll: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Anggota',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ..._members,
              SizedBox(height: 20),
              MemberInputField(
                hintText: 'Tambahkan anggota lain',
                onTap: _addMemberField,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Simpan logika anggota
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class MemberInputField extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;

  const MemberInputField({Key? key, required this.hintText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        onTap: onTap,
      ),
    );
  }
}
