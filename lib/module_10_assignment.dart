import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseGridPage(),
    );
  }
}

class CourseGridPage extends StatelessWidget {
  final List<CourseModel> courses = [
    CourseModel(
      title: "Full Stack Web Development with JavaScript (MERN)",
      image: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80",
      category: "ফুল স্ট্যাক",
      subtitle: "ওয়েব ডেভেলপমেন্ট",
      duration: "৬ মাস",
      lectures: "১২০ লেকচার",
      price: "৳ ৮,৫০০",
    ),
    CourseModel(
      title: "Full Stack Web Development with Python, Django & React",
      image: "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?q=80",
      category: "ফুল স্ট্যাক",
      subtitle: "ওয়েব ডেভেলপমেন্ট",
      duration: "৮ মাস",
      lectures: "১৪০ লেকচার",
      price: "৳ ৯,২০০",
    ),
    CourseModel(
      title: "Full Stack Web Development with ASP.Net Core",
      image: "https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80",
      category: "ফুল স্ট্যাক",
      subtitle: "ওয়েব ডেভেলপমেন্ট",
      duration: "৫ মাস",
      lectures: "১০০ লেকচার",
      price: "৳ ৭,০০০",
    ),
    CourseModel(
      title: "SQA: Manual & Automated Testing",
      image: "https://images.unsplash.com/photo-1587620962725-abab7fe55159?q=80",
      category: "SQA",
      subtitle: "টেস্টিং",
      duration: "৩ মাস",
      lectures: "৬০ লেকচার",
      price: "৳ ৪,৫০০",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Courses", style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // ✅ 2 cards in a row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.72,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return CourseCard(course: courses[index]);
          },
        ),
      ),
    );
  }
}

class CourseCard extends StatefulWidget {
  final CourseModel course;

  const CourseCard({required this.course});

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.03 : 1.0,
        duration: Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            boxShadow: _isHovered
                ? [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 1)]
                : [],
          ),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Keep your header section untouched
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(widget.course.image,
                          height: 120, width: double.infinity, fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Row(
                        children: [
                          _badge(widget.course.category, Colors.blue),
                          SizedBox(width: 6),
                          _badge(widget.course.subtitle, Colors.white70,
                              textColor: Colors.black87),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      right: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _meta(widget.course.duration),
                          _meta(widget.course.lectures),
                          _priceBadge(widget.course.price),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(widget.course.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text("বিস্তারিত দেখুন", style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ badges and meta same as before (keep them)
  Widget _badge(String text, Color bgColor, {Color textColor = Colors.white}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: TextStyle(color: textColor, fontSize: 10)),
    );
  }

  Widget _meta(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: TextStyle(fontSize: 9)),
    );
  }

  Widget _priceBadge(String price) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(price, style: TextStyle(fontSize: 9, color: Colors.orange)),
    );
  }
}

class CourseModel {
  final String title, image, category, subtitle, duration, lectures, price;

  CourseModel({
    required this.title,
    required this.image,
    required this.category,
    required this.subtitle,
    required this.duration,
    required this.lectures,
    required this.price,
  });
}
