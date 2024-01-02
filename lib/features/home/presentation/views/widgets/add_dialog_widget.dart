import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wesaya/core/utils/extensions.dart';
import 'package:wesaya/features/home/presentation/controllers/category_provider.dart';

import '../../../data/models/category_model.dart';

class AddDialogWidget extends StatefulWidget {
  const AddDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddDialogWidget> createState() => _AddDialogWidgetState();
}

class _AddDialogWidgetState extends State<AddDialogWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isActive = false;
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Switch(
                // This bool value toggles the switch.
                value: isActive,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    isActive = value;
                  });
                },
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  context.pop();
                  await context.read<CategoryProvider>().addCategory(
                        CategoryModel(
                          name: nameController.text,
                          id: -50,
                          isActive: isActive,
                        ),
                      );
                },
                child: const Text(
                  'Add',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
