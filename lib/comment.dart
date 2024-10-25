import 'package:flutter/material.dart';

final TextEditingController _controller = TextEditingController();

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  String? selectedValue1;
  String? selectedValue2;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.85,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  scrollPadding: EdgeInsets.all(20),
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Enter a comment",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              SizedBox(height: 24),
              _buildDropdown(
                items: ['movie', 'food'],
                value: selectedValue1,
                hint: "About",
                onChanged: (newValue) {
                  setState(() {
                    selectedValue1 = newValue;
                  });
                },
              ),
              SizedBox(height: 16),
              _buildDropdown(
                items: [
                  'nonsense',
                  'program',
                  'elizabethan english',
                  'corporate language',
                  'philosophy'
                ],
                value: selectedValue2,
                hint: "Type",
                onChanged: (newValue) {
                  setState(() {
                    selectedValue2 = newValue;
                  });
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Calls the submit handler
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurpleAccent,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  shadowColor: Colors.deepPurpleAccent.withOpacity(0.5),
                ),
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required List<String> items,
    required String? value,
    required String hint,
    required void Function(String?) onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButton<String>(
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        value: value,
        onChanged: onChanged,
        hint: Text(hint),
        isExpanded: true,
        underline: SizedBox(), // Removes the default underline
        dropdownColor: Colors.white,
        style: TextStyle(color: Colors.black87, fontSize: 16),
        iconEnabledColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
