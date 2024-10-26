import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final TextEditingController _controller = TextEditingController();

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  String? selectedValue1;
  String? selectedValue2;
  String geminiResult = ""; // To store the Gemini result
  final GeminiService geminiService = GeminiService(); // Create an instance of GeminiService

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF6A1B9A),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A1B9A), Color(0xFF9C27B0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Share Your Thoughts",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: screenWidth * 0.85,
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildDropdown(
                    items: [
    "Movies", "TV Shows", "Music", "Books", "Video Games", "Celebrity News",
    "Food", "Travel", "Fashion", "Health & Wellness", "Personal Development", "Home & Decor",
    "Gadgets", "Artificial Intelligence", "Programming", "Space Exploration", "Software Development", "Blockchain",
    "Biology", "Psychology", "Physics", "Mathematics", "History", "Literature",
    "Economics", "Investing", "Startups", "Real Estate", "Marketing", "Personal Finance",
    "Ethics", "Existentialism", "Positive Thinking", "Stoicism", "Mindfulness", "Motivation",
    "Environmental Issues", "Gender Equality", "Human Rights", "Mental Health Awareness", "Politics", "Animal Welfare",
    "Football/Soccer", "Basketball", "Yoga", "Nutrition", "Running", "Fitness Training",
    "Painting", "Photography", "Writing", "Sculpting", "Dance", "Graphic Design",
    "Trivia", "Random Fun Facts", "Cultural Traditions", "Astrology", "Mythology", "Language & Linguistics"],
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
                    items:[
    "Nonsense", "Program", "Elizabethan English", "Corporate Language", "Philosophy",
    "Shakespearean English", "Sarcastic Humor", "Romantic Poem", "Haiku", "Limerick",
    "Scientific Explanation", "Conspiracy Theory", "Motivational Speech", "Stand-up Comedy",
    "Tech Support Response", "Old Western", "Pirate Talk", "Medieval Knight", "Detective Noir",
    "Inspirational Quote", "Horoscope Style", "AI Assistant", "Fitness Coach", "Yoga Instructor",
    "Marketing Pitch", "Weather Forecast", "Ancient Greek Philosopher", "Advice Column",
    "Song Lyrics", "Cooking Recipe", "Zen Koan", "Kids' Story", "Space Mission Report",
    "Robot Language", "Formal Apology", "Legal Document", "Mythological Tale", "Business Analyst",
    "Product Review", "Fantasy Epic", "Political Speech", "Meditation Guide", "Mystery Novelist",
    "Economic Forecast", "Sports Commentary", "Tabloid Headline", "Art Critique", "Superhero Comic",
    "Astrological Reading", "Rap Battle", "Reality TV Confession", "Romantic Letter", "Pirate Ballad"],
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
                    onPressed: () async {
                      if (_controller.text.isNotEmpty &&
                          selectedValue1 != null &&
                          selectedValue2 != null) {
                        // Call the function to get the answer from Gemini
                        String result = await geminiService.getAnswer(
                          _controller.text,
                          selectedValue2!,
                          selectedValue1!,
                        );
                        setState(() {
                          geminiResult = result; // Update the result to be displayed
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.deepPurpleAccent.withOpacity(0.5),
                      elevation: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.send, color: Color(0xFF6A1B9A)), // Add an icon
                        SizedBox(width: 8),
                        Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6A1B9A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30), // Increased space before displaying the result
                  // Display the Gemini result
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      geminiResult.isNotEmpty ? geminiResult : "Please enter a comment and select options.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                        letterSpacing: 1.2,
                        fontStyle: FontStyle.italic, // Italic for emphasis
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
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
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
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
            child: Text(item, style: TextStyle(color: Colors.black)),
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

class GeminiService {
  // Replace with your actual API key
  final String geminiAPIKey = 'AIzaSyD2alKChT_ovlqRgzCYPUlN5kl_9dCBcwA';

  Future<String> getAnswer(String question, String selectedMode, String category) async {
    // Modify the question based on selected mode and category
    String modifiedQuestion = _getModifiedQuestion(question, selectedMode, category);

    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$geminiAPIKey',
    );

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {
                  "text": modifiedQuestion,
                },
              ],
            },
          ],
        }),
      );

      // Log the response for debugging
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Access the correct fields based on the response structure
        if (data['candidates'] != null && data['candidates'].isNotEmpty) {
          return data['candidates'][0]['content']['parts'][0]['text'] ?? 
                 "No answer available.";
        } else {
          return "No candidates returned.";
        }
      } else {
        return "Error: ${response.statusCode}, ${response.body}";
      }
    } catch (error) {
      return "Failed to get an answer: $error"; // Show specific error
    }
  }

  // Function to modify the question based on the selected response mode and category
  String _getModifiedQuestion(String question, String selectedMode, String category) {
    return "Transform the following feedback into $selectedMode style, focusing on $category: \"$question\".";
}
}
