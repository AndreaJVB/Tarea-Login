import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget{
  const CustomDialog({super.key, this.title, this.content, this.actions});

  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
  
        return AlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      
  }
  
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      },
    );
  }
}

 


// class CustomDialog {
//   static Future<void> showCustomDialog(BuildContext context, {
//     required String title,
//     required String content,
//     String confirmText = 'OK',
//     String cancelText = 'Cancel',
//     VoidCallback? onConfirm,
//     VoidCallback? onCancel,
//   }) {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // El usuario debe presionar un botón para cerrar el diálogo
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text(content),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text(cancelText),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 if (onCancel != null) {
//                   onCancel();
//                 }
//               },
//             ),
//             ElevatedButton(
//               child: Text(confirmText),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 if (onConfirm != null) {
//                   onConfirm();
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
