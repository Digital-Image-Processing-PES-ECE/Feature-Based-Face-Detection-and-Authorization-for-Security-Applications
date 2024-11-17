# Project Name-
Feature-Based Face Detection and Authorization for Security Applications

### Project Description:
This project implements a face recognition-based security system using MATLAB. It uses Local Binary Pattern (LBP) features to differentiate between authorized and unauthorized individuals. Unauthorized access triggers an alarm and logs the captured face.

#### Summary -
 This project implements a robust face recognition-based security system using MATLAB. Leveraging Local Binary Pattern (LBP) features, the system effectively distinguishes between authorized and unauthorized individuals in real time. When unauthorized access is detected, the system triggers an alarm and logs the captured face image for further review.

#### Course concepts used - 
1. -Digital Image Processing
Grayscale conversion and resizing for pre-processing.

2. -Feature Extraction
LBP for representing facial features in a computationally efficient manner.

3. -Pattern Recognition
Similarity measures to match live face data with authorized faces.
   
#### Additional concepts used -
1. -Machine Vision
Real-time face detection using vision.CascadeObjectDetector.

2. -Data Logging
Automated storage of unauthorized access attempts with timestamps
   
#### Dataset - 
Generated Dataset: The project creates its own dataset by capturing images of authorized individuals using a webcam. These images are processed to extract LBP features for recognition.
No external dataset is required for this application.

#### Novelty - 
1. -Real-time Face Detection and Recognition: Integrates real-time face detection with an efficient recognition mechanism.
2. -Low Computational Overhead: LBP-based features offer fast and lightweight facial analysis.
3. -Built-in Security Alerts: Unauthorized access triggers both visual and auditory alarms for immediate action.
   
### Contributors:
1. Neha S Babu(PES1UG22EC174)-Developed the webcam interface for capturing the authorized person's image.​Implemented the code to save the captured image with the person's name
2. Prakruthi G P(PES1UG22EC204)-Implemented the LBP feature extraction and stored the features in authorizedLBPDatabase.mat for multiple authorized images.​Created the LBP feature extraction loop to process multiple authorized face images.
3. Ramya G Raj(PES1UG22EC231)​-Integrated real-time face detection using Haar Cascade with LBP-based feature matching.​ Developed the logic for comparing detected faces with authorized LBP features and handling alerts for unauthorized access, including image capture and sound notification.​



### Outputs:
*![alt text](<Screenshot 2024-11-17 194018.png>)
* 

### References:
1. -1.	Face Recognition Algorithms
o	Ahonen, T., Hadid, A., & Pietikainen, M. (2006). Face Description with Local Binary Patterns: Application to Face Recognition. IEEE Transactions on Pattern Analysis and Machine Intelligence.

2. -2.	Feature Extraction Techniques
o	Ojala, T., Pietikäinen, M., & Harwood, D. (1996). A Comparative Study of Texture Measures with Classification Based on Feature Distributions. Pattern Recognition.

   
### Limitations and Future Work:
Limitations:

Illumination Variations: Performance may degrade under poor lighting conditions.
Pose and Expression Variations: Limited to frontal face detection with minimal variation.
Threshold Sensitivity: Manual tuning of similarity threshold may not generalize to all scenarios.
Future Work:

Deep Learning Integration: Replace LBP with a deep learning-based model for improved accuracy.
Multi-Factor Authentication: Combine facial recognition with other authentication methods like voice or fingerprint recognition.
Scalability: Extend the system to work in larger, multi-camera setups for broader coverage.
