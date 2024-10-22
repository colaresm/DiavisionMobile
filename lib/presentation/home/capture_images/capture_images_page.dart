import 'dart:io';

import 'package:camera/camera.dart';
import 'package:diavision/presentation/widgets/body/body.dart';
import 'package:diavision/presentation/widgets/default_button/default_button.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  CameraDescription? firstCamera;
  
  List<String> _imagePaths = [];

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    firstCamera = cameras.first;
  }

  void _openCamera() {
    setState(() {
      if (firstCamera != null) {
        _controller = CameraController(
          firstCamera!,
          ResolutionPreset.high,
        );
        _initializeControllerFuture = _controller?.initialize();
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Body(
      content: Column(
        children: [
          DefaultButton(
            minWidth: 20,
            label: "Open Camera",
            onPressed: () {
              _openCamera();
            },
          ),
          if (_controller != null)
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(maxHeight: 400),
                        child: CameraPreview(_controller!),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _takePicture();
                        },
                        child: Text("Take Picture"),
                      ),
                      // Exibir as imagens capturadas
                      Expanded(
                        child: ListView.builder(
                          itemCount: _imagePaths.length,
                          itemBuilder: (context, index) {
                            return Image.file(
                              File(_imagePaths[index]),
                              height: 100,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
        ],
      ),
      onRefresh: () {
        _initCamera();
      },
    );
  }

  Future<void> _saveImageToGallery(String imagePath) async {
    final result = await ImageGallerySaver.saveFile(imagePath);
    print("Imagem salva na galeria: $result");
  }

  Future<void> _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized) {
      try {
        await _initializeControllerFuture;

        final image = await _controller!.takePicture();
        await _requestPermission();
        await _saveImageToGallery(image.path);

        // Adiciona o caminho da imagem à lista
        setState(() {
          _imagePaths.add(image.path);
        });
      } catch (e) {
        print("Erro ao capturar a imagem: $e");
      }
    }
  }

  Future<void> _requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }
}
