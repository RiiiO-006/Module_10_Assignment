import 'package:flutter/material.dart';

class Course {
  final String imagePath;
  final String title;
  final String batch;
  final String seatsLeft;
  final String daysLeft;

  const Course({
    required this.imagePath,
    required this.title,
    required this.batch,
    required this.seatsLeft,
    required this.daysLeft,
    required BoxFit fit,
    required style,
  });
}

const List<Course> courseData = [
  Course(
    imagePath: 'assets/images/image1.jpg',
    title: 'Full Stack Web Development with JavaScript (MERN)',
    style: TextStyle(fontWeight: FontWeight.bold),
    batch: 'ব্যাচ ১১',
    seatsLeft: '৬ সিট বাকি',
    daysLeft: '৬ দিন বাকি',
    fit: BoxFit.cover,
  ),
  Course(
    imagePath: 'assets/images/image2.jpg',
    title: 'Full Stack Web Development with Python, Django & React',
    style: TextStyle(fontWeight: FontWeight.bold),
    batch: 'ব্যাচ ৬',
    seatsLeft: '৮৬ সিট বাকি',
    daysLeft: '৪০ দিন বাকি',
    fit: BoxFit.cover,
  ),
  Course(
    imagePath: 'assets/images/image3.jpg',
    title: 'Full Stack Web Development with ASP.NET Core',
    style: TextStyle(fontWeight: FontWeight.bold),
    batch: 'ব্যাচ ৭',
    seatsLeft: '৭৫ সিট বাকি',
    daysLeft: '৩৯ দিন বাকি',
    fit: BoxFit.cover,
  ),
  Course(
    imagePath: 'assets/images/image4.jpg',
    title: 'SQA: Manual & Automated Testing',
    style: TextStyle(fontWeight: FontWeight.bold),
    batch: 'ব্যাচ ১৩',
    seatsLeft: '৬৫ সিট বাকি',
    daysLeft: '৪১ দিন বাকি',
    fit: BoxFit.cover,
  ),
];

class CourseCardsGrid extends StatelessWidget {
  const CourseCardsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1000;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GridView.builder(
              itemCount: courseData.length,
              shrinkWrap: true,
              physics:
              const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLargeScreen ? 3 : 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 34,
                childAspectRatio: isLargeScreen ? 0.9 : 0.62,
              ),
              itemBuilder: (context, index) {
                return _CourseCard(course: courseData[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final Course course;

  const _CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5) ,
            blurRadius: 6,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            child: Image.asset(
              course.imagePath,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Wrap(
              spacing: 6,
              runSpacing: 4,
              children: [
                _buildInfoChip(course.batch, Icons.calendar_today_outlined),
                _buildInfoChip(course.seatsLeft, Icons.group_outlined),
                _buildInfoChip(course.daysLeft, Icons.access_time_outlined),
              ],
            ),
          ),

          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              course.title,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFFF8F9FA),
                  side: const BorderSide(color: Color(0xFFE0E0E0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 15,
                  color: Colors.black87,
                ),
                label: const Text(
                  'বিস্তারিত দেখুন',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: Colors.black54),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(fontSize: 11, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}