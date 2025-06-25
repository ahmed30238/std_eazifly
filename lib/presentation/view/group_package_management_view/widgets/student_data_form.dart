// import 'package:flutter/material.dart';

// class StudentDataForm extends StatefulWidget {
//   const StudentDataForm({super.key});

//   @override
//   _StudentDataFormState createState() => _StudentDataFormState();
// }

// class _StudentDataFormState extends State<StudentDataForm> {
//   String selectedAppointmentType = 'ثابتة';
//   int sessionsCount = 8;
//   String selectedScheduleType = 'تحديد كل المواعيد';
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;
//   bool showFilters = false;
//   String? selectedTeacher;
//   String? selectedSubject;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F5F5),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text(
//             'عودة',
//             style: TextStyle(color: Colors.blue, fontSize: 16),
//           ),
//         ),
//         title: Text(
//           'إضافة بيانات طالب لبرنامج',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         actions: [SizedBox(width: 60)], // For balance
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Appointment Type Section
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 10,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'أختر نوع المواعيد للطالب',
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 14,
//                     ),
//                   ),
//                   SizedBox(height: 12),
                  
//                   // Appointment Type Buttons
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _buildToggleButton(
//                           'مواعيد ثابتة',
//                           selectedAppointmentType == 'ثابتة',
//                           () => setState(() => selectedAppointmentType = 'ثابتة'),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: _buildToggleButton(
//                           'مواعيد مرنة',
//                           selectedAppointmentType == 'مرنة',
//                           () => setState(() => selectedAppointmentType = 'مرنة'),
//                         ),
//                       ),
//                     ],
//                   ),
                  
//                   SizedBox(height: 16),
                  
//                   // Sessions Count
//                   Text(
//                     'عدد الحصص المتاحة',
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 14,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey[300]!),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       '$sessionsCount',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
                  
//                   SizedBox(height: 16),
                  
//                   // Schedule Type Buttons
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _buildToggleButton(
//                           'تحديد كل المواعيد',
//                           selectedScheduleType == 'تحديد كل المواعيد',
//                           () => setState(() => selectedScheduleType = 'تحديد كل المواعيد'),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: _buildToggleButton(
//                           'تكرار الحصص أسبوعياً',
//                           selectedScheduleType == 'تكرار الحصص أسبوعياً',
//                           () => setState(() => selectedScheduleType = 'تكرار الحصص أسبوعياً'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
            
//             SizedBox(height: 16),
            
//             // Date and Time Section
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 10,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   // Date Selection
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'اليوم',
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                           fontSize: 14,
//                         ),
//                       ),
//                       Text(
//                         'أختر',
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
                  
//                   SizedBox(height: 12),
                  
//                   InkWell(
//                     onTap: _selectDate,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey[300]!),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Icon(Icons.calendar_today, color: Colors.grey[400]),
//                           Text(
//                             selectedDate != null
//                                 ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
//                                 : 'اختر التاريخ',
//                             style: TextStyle(
//                               color: selectedDate != null ? Colors.black : Colors.grey[500],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
                  
//                   SizedBox(height: 16),
                  
//                   // Time Selection
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'الوقت',
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                           fontSize: 14,
//                         ),
//                       ),
//                       Text(
//                         'aa/mm/hh',
//                         style: TextStyle(
//                           color: Colors.grey[400],
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
                  
//                   SizedBox(height: 8),
                  
//                   InkWell(
//                     onTap: _selectTime,
//                     child: Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey[300]!),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         selectedTime != null
//                             ? '${selectedTime!.format(context)}'
//                             : 'اختر الوقت',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: selectedTime != null ? Colors.black : Colors.grey[500],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
            
//             SizedBox(height: 16),
            
//             // Filters Section
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 10,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'الفلاتر',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () => setState(() => showFilters = !showFilters),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.filter_list,
//                               color: Colors.blue,
//                               size: 20,
//                             ),
//                             SizedBox(width: 4),
//                             Text(
//                               showFilters ? 'إخفاء الفلاتر' : 'إظهار الفلاتر',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
                  
//                   if (showFilters) ...[
//                     SizedBox(height: 16),
//                     Divider(),
//                     SizedBox(height: 16),
                    
//                     // Teacher Filter
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'المعلم',
//                           style: TextStyle(
//                             color: Colors.grey[600],
//                             fontSize: 14,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         DropdownButtonFormField<String>(
//                           value: selectedTeacher,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide(color: Colors.grey[300]!),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                           ),
//                           hint: Text('اختر المعلم'),
//                           items: [
//                             DropdownMenuItem(value: 'teacher1', child: Text('أحمد محمد')),
//                             DropdownMenuItem(value: 'teacher2', child: Text('فاطمة علي')),
//                             DropdownMenuItem(value: 'teacher3', child: Text('محمد حسن')),
//                           ],
//                           onChanged: (value) => setState(() => selectedTeacher = value),
//                         ),
//                       ],
//                     ),
                    
//                     SizedBox(height: 16),
                    
//                     // Subject Filter
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'المادة',
//                           style: TextStyle(
//                             color: Colors.grey[600],
//                             fontSize: 14,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         DropdownButtonFormField<String>(
//                           value: selectedSubject,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide(color: Colors.grey[300]!),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                           ),
//                           hint: Text('اختر المادة'),
//                           items: [
//                             DropdownMenuItem(value: 'math', child: Text('الرياضيات')),
//                             DropdownMenuItem(value: 'arabic', child: Text('اللغة العربية')),
//                             DropdownMenuItem(value: 'english', child: Text('اللغة الإنجليزية')),
//                             DropdownMenuItem(value: 'science', child: Text('العلوم')),
//                           ],
//                           onChanged: (value) => setState(() => selectedSubject = value),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ],
//               ),
//             ),
            
//             SizedBox(height: 24),
            
//             // Submit Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _submitForm,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: Text(
//                   'التالي',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.blue : Colors.grey[100],
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.grey[700],
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _selectDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(Duration(days: 365)),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: ColorScheme.light(
//               primary: Colors.blue,
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _selectTime() async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime ?? TimeOfDay.now(),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: ColorScheme.light(
//               primary: Colors.blue,
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }

//   void _submitForm() {
//     // Handle form submission
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('تم الإرسال'),
//         content: Text('تم إرسال بيانات الطالب بنجاح!'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('موافق'),
//           ),
//         ],
//       ),
//     );
//   }
// }