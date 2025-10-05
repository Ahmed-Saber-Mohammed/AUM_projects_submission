import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitPrototypePage extends StatefulWidget {
  const SubmitPrototypePage({super.key});

  @override
  State<SubmitPrototypePage> createState() => _SubmitPrototypePageState();
}

class _SubmitPrototypePageState extends State<SubmitPrototypePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _techStackController = TextEditingController();
  String _stage = 'Concept';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _techStackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.black.withOpacity(0.02),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: _buildForm(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
          const SizedBox(width: 16),
          Text(
            'Submit Prototype',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prototype Submission',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Showcase your working prototypes and innovative solutions',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 40),
            _buildTextField(
              controller: _nameController,
              label: 'Full Name',
              hint: 'Enter your full name',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: _emailController,
              label: 'Email Address',
              hint: 'your.email@example.com',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: _titleController,
              label: 'Prototype Title',
              hint: 'Enter your prototype title',
              icon: Icons.lightbulb_outline,
            ),
            const SizedBox(height: 24),
            _buildDropdown(),
            const SizedBox(height: 24),
            _buildTextField(
              controller: _techStackController,
              label: 'Technology Stack',
              hint: 'e.g., Flutter, Firebase, Arduino',
              icon: Icons.code,
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: _descriptionController,
              label: 'Description',
              hint: 'Describe your prototype, its features, and potential applications',
              icon: Icons.description_outlined,
              maxLines: 6,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Submit Prototype',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: Colors.black87),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black87, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Development Stage',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _stage,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.timeline, color: Colors.black87),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black87, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
          items: ['Concept', 'Prototype', 'MVP', 'Production']
              .map((stage) => DropdownMenuItem(
                    value: stage,
                    child: Text(stage),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _stage = value!;
            });
          },
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Prototype submitted successfully!',
            style: GoogleFonts.inter(),
          ),
          backgroundColor: Colors.black87,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      
      // Clear form
      _nameController.clear();
      _emailController.clear();
      _titleController.clear();
      _descriptionController.clear();
      _techStackController.clear();
    }
  }
}
