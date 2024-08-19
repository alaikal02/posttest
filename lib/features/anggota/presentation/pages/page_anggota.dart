import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class PageAnggota extends StatefulWidget {
  @override
  _PageAnggotaState createState() => _PageAnggotaState();
}

class _PageAnggotaState extends State<PageAnggota> {
  // Inisialisasi dengan tiga controller default
  List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  void _addMemberField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _saveMembers() {
    List<String> memberNames = _controllers
        .map((controller) => controller.text)
        .where((text) => text.isNotEmpty)
        .toList();

    Navigator.pushReplacementNamed(
      context,
      '/task',
      arguments: memberNames,
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
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
              // Menampilkan semua field input
              ..._controllers.asMap().entries.map((entry) {
                int index = entry.key;
                TextEditingController controller = entry.value;
                return MemberInputField(
                  controller: controller,
                  hintText: index == _controllers.length - 1
                      ? 'Tambahkan anggota lain'
                      : 'Nama',
                  onTap: index == _controllers.length - 1
                      ? _addMemberField
                      : null,
                );
              }).toList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveMembers,
        child: Icon(Icons.save),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class MemberInputField extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;
  final TextEditingController controller;

  const MemberInputField({
    Key? key,
    required this.hintText,
    this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        onTap: onTap,
      ),
    );
  }
}
