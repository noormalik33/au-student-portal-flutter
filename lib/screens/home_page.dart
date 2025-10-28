// ============================================
// screens/home_page.dart
// ============================================
import 'package:flutter/material.dart';
import 'login_screen.dart'; // needed for Navigator to LoginScreen

class HomePage extends StatefulWidget {
  final String studentId;
  final String studentName;

  const HomePage({
    Key? key,
    required this.studentId,
    required this.studentName,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _semesterLevel = 4;
  double _gpaProgress = 3.5;
  bool _showGPA = true;

  final List<Map<String, dynamic>> _subjects = [
    {
      'name': 'Mathematics',
      'code': 'MATH-301',
      'icon': Icons.calculate,
      'color': const Color(0xFF6A1B9A),
      'credits': '3',
    },
    {
      'name': 'Database Management',
      'code': 'DBMS-402',
      'icon': Icons.storage,
      'color': const Color(0xFF00838F),
      'credits': '4',
    },
    {
      'name': 'Data Structures',
      'code': 'DS-303',
      'icon': Icons.account_tree,
      'color': const Color(0xFFD84315),
      'credits': '3',
    },
    {
      'name': 'Operating Systems',
      'code': 'OS-404',
      'icon': Icons.computer,
      'color': const Color(0xFF2E7D32),
      'credits': '4',
    },
    {
      'name': 'Software Engineering',
      'code': 'SE-405',
      'icon': Icons.engineering,
      'color': const Color(0xFFF57C00),
      'credits': '3',
    },
    {
      'name': 'Web Technologies',
      'code': 'WT-306',
      'icon': Icons.web,
      'color': const Color(0xFF1976D2),
      'credits': '3',
    },
  ];

  int _notificationCount = 5;

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: const [
            Icon(Icons.logout, color: Colors.red),
            SizedBox(width: 10),
            Text('Logout Confirmation'),
          ],
        ),
        content: const Text(
          'Are you sure you want to logout from AU Student Portal?',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('CANCEL', style: TextStyle(fontSize: 16)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('LOGOUT', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'AU Student Portal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF1565C0),
          foregroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.notifications),
                  if (_notificationCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$_notificationCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You have $_notificationCount new notifications'),
                    backgroundColor: const Color(0xFF1565C0),
                  ),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Color(0xFF1565C0),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.studentName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ID: ${widget.studentId} | BSCS',
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Color(0xFF1565C0)),
                title: const Text('Profile', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Opening Profile...'),
                      backgroundColor: Color(0xFF1565C0),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.grade, color: Color(0xFF1565C0)),
                title: const Text('Results', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Loading Results...'),
                      backgroundColor: Color(0xFF1565C0),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.schedule, color: Color(0xFF1565C0)),
                title: const Text('Time Table', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Opening Time Table...'),
                      backgroundColor: Color(0xFF1565C0),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.payment, color: Color(0xFF1565C0)),
                title: const Text('Fee Status', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Checking Fee Status...'),
                      backgroundColor: Color(0xFF1565C0),
                    ),
                  );
                },
              ),
              const Divider(thickness: 1),
              ListTile(
                leading: const Icon(Icons.settings, color: Color(0xFF1565C0)),
                title: const Text('Settings', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Opening Settings...'),
                      backgroundColor: Color(0xFF1565C0),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.help, color: Color(0xFF1565C0)),
                title: const Text('Help & Support', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Contact: support@au.edu.pk'),
                      backgroundColor: Color(0xFF1565C0),
                    ),
                  );
                },
              ),
              const Divider(thickness: 1),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onWillPop();
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            // Slider Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _showGPA
                            ? 'Current GPA: ${_gpaProgress.toStringAsFixed(2)}'
                            : 'Semester Level: ${_semesterLevel.toInt()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _showGPA = !_showGPA;
                          });
                        },
                        icon: const Icon(Icons.swap_horiz, color: Colors.white),
                        tooltip: 'Toggle View',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Slider(
                    value: _showGPA ? _gpaProgress : _semesterLevel,
                    min: _showGPA ? 0.0 : 1.0,
                    max: _showGPA ? 4.0 : 8.0,
                    divisions: _showGPA ? 40 : 7,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white38,
                    label: _showGPA
                        ? _gpaProgress.toStringAsFixed(2)
                        : _semesterLevel.toInt().toString(),
                    onChanged: (value) {
                      setState(() {
                        if (_showGPA) {
                          _gpaProgress = value;
                        } else {
                          _semesterLevel = value;
                        }
                      });
                    },
                    onChangeEnd: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _showGPA
                                ? 'Target GPA: ${value.toStringAsFixed(2)}'
                                : 'Semester: ${value.toInt()}',
                          ),
                          duration: const Duration(seconds: 1),
                          backgroundColor: const Color(0xFF1565C0),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Subjects Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Subjects',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1565C0),
                    ),
                  ),
                  Text(
                    'Total: ${_subjects.length}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            // GridView Section
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                children: _subjects.map((subject) {
                  return Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${subject['name']} (${subject['code']}) - ${subject['credits']} Credits',
                            ),
                            backgroundColor: subject['color'],
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'VIEW',
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              subject['color'],
                              subject['color'].withOpacity(0.7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                subject['icon'],
                                size: 55,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                subject['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                subject['code'],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '${subject['credits']} Credits',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              _notificationCount++;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.notifications_active, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'New notification! Total: $_notificationCount',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                backgroundColor: const Color(0xFF1565C0),
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          backgroundColor: const Color(0xFF1565C0),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.notifications),
          label: const Text(
            'Check Notifications',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}