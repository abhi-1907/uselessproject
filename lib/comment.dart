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

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A1B9A), Color(0xFF9C27B0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Share Your Thoughts",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter a comment",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                _buildDropdown(
                  items: ['Movie', 'Food'],
                  value: selectedValue1,
                  hint: "Category",
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue1 = newValue;
                    });
                  },
                ),
                SizedBox(height: 16),
                _buildDropdown(
                  items: [
                    'Nonsense',
                    'Program',
                    'Elizabethan English',
                    'Corporate Language',
                    'Philosophy'
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
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.white,
                    shadowColor: Colors.deepPurpleAccent.withOpacity(0.5),
                    elevation: 10,
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A1B9A),
                    ),
                  ),
                ),
              ],
            ),
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
        borderRadius: BorderRadius.circular(15),
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
        hint: Text(hint, style: TextStyle(color: Colors.grey[600])),
        isExpanded: true,
        underline: SizedBox(),
        dropdownColor: Colors.white,
        style: TextStyle(color: Colors.black87, fontSize: 16),
        iconEnabledColor: Color(0xFF6A1B9A),
      ),
    );
  }
}
