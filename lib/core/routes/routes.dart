import 'package:diavision/presentation/home/capture_images/capture_images_page.dart';
import 'package:diavision/presentation/register_patient/register_patient_page.dart';
import 'package:flutter/material.dart';

redirectToRegisterPatientPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const RegisterPatientPage()),
  );
}
redirectToRegisterCaptureImagesPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  CameraApp()),
  );
}
