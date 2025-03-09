import 'package:flutter/material.dart';

class VerifingCodeDialog extends StatefulWidget {
  @override
  _VerifingCodeDialogState createState() => _VerifingCodeDialogState();
}

class _VerifingCodeDialogState extends State<VerifingCodeDialog> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];
  bool showError =
      false; // To track if any field is empty after pressing Enter or Verify

  @override
  void initState() {
    super.initState();
    controllers.addAll([controller1, controller2, controller3, controller4]);
    focusNodes.addAll([focusNode1, focusNode2, focusNode3, focusNode4]);

    // Focus on the first field when the dialog is shown for the first time
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode1);
    });
  }

  // This method validates the code and handles the "Enter" key press.
  void validateCode() {
    setState(() {
      showError = controllers.any((controller) => controller.text.isEmpty);
    });

    if (!showError) {
      // All fields are filled, print the code
      String code = controllers.map((controller) => controller.text).join();
      print("Verification Code: $code");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Enter Verification Code Sent to: example@email.com"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTextFormField(controller1, focusNode1, 0, focusNode2),
              SizedBox(width: 10), // Add space between the fields
              buildTextFormField(controller2, focusNode2, 1, focusNode3),
              SizedBox(width: 10), // Add space between the fields
              buildTextFormField(controller3, focusNode3, 2, focusNode4),
              SizedBox(width: 10), // Add space between the fields
              buildTextFormField(controller4, focusNode4, 3, null),
            ],
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: validateCode, // Validate when "Verify" is pressed
          child: Text('Verify'),
        ),
      ],
    );
  }

  Widget buildTextFormField(TextEditingController controller,
      FocusNode focusNode, int index, FocusNode? nextFocusNode) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          // Set border color to red if there is an error (empty text field)
          focusedBorder: showError && controller.text.isEmpty
              ? OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
              : OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: showError && controller.text.isEmpty
              ? OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
              : OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && nextFocusNode != null) {
            FocusScope.of(context)
                .requestFocus(nextFocusNode); // Move focus to the next field
          } else if (value.isEmpty && index != 0) {
            // Move focus to the previous field when deleting the text
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
        },
        onEditingComplete: () {
          validateCode(); // Validate and print code when Enter is pressed
        },
        onTap: () {
          // Prevent tapping on any field except the first one
          if (index != 0) {
            FocusScope.of(context).requestFocus(focusNode1);
          }
        },
      ),
    );
  }
}
