import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:swaasthya/apis/urls.dart';
import 'package:swaasthya/pages/add_medical_history_form/add_medical_history_form.dart';
import 'package:swaasthya/utils/classes/medical_history_class.dart';

class MedicalHistoryPage extends StatefulWidget {
  final dynamic patient;
  final String? token;
  const MedicalHistoryPage({super.key, this.patient, this.token});

  @override
  State<MedicalHistoryPage> createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  bool hasData = true, err = false, loading = true;
  MedicalHistory medicalHistory = MedicalHistory();

  void _getMedicalHistory() async {
    try {
      final response = await http.get(
        Uri.parse(
            '$apiUrl/history/${widget.patient['hospitalID']}/patient/${widget.patient['id']}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': widget.token ?? '',
        },
      );
      var body = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        setState(() {
          medicalHistory = MedicalHistory.fromMap(body['medicalHistory']);
          //medicalHistory.printAllValues();
        });
      } else if (body?['error'] == 'Failed to get medical history') {
        setState(() {
          hasData = false;
        });
      }
      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        err = true;
        loading = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getMedicalHistory();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            loading
                ? const CircularProgressIndicator()
                : !hasData
                    ? Column(
                        children: [
                          const Text('No medical history found'),
                          const SizedBox(
                            height: 8,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return AddMedicalHistoryForm(
                                    patient: widget.patient,
                                    token: widget.token,
                                    isEdit: false,
                                  );
                                }),
                              );
                            },
                            child: const Text('Add Patient Medical History'),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Medical History'),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                          return AddMedicalHistoryForm(
                                            patient: widget.patient,
                                            token: widget.token,
                                            isEdit: true,
                                            editData: medicalHistory,
                                          );
                                        }),
                                      );
                                    },
                                    icon: const Icon(Icons.edit)),
                              ],
                            ),
                          ),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width >= 600
                                            ? 350
                                            : double.infinity),
                                padding: const EdgeInsets.all(16),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Information Provider Details',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Given By: '),
                                            Text(medicalHistory.givenName),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Phone Number: '),
                                            Text(medicalHistory.givenPhone),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                                'Relationship with Patient: '),
                                            Text(medicalHistory.givenRelation),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width >= 600
                                            ? 350
                                            : double.infinity),
                                padding: const EdgeInsets.all(16),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Basic Information About Patient',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Blood Group: '),
                                            Text(medicalHistory.bloodGroup),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Blood Pressure: '),
                                            Text(medicalHistory.highBp
                                                ? 'High BP'
                                                : medicalHistory.lowBp
                                                    ? 'Low BP'
                                                    : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Diabetes: '),
                                            Text(medicalHistory.diabetes
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Surgery: '),
                                            Text(medicalHistory.surgery
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                                'Hyper Lipidameia/Dyslipidaemia: '),
                                            Text(medicalHistory.lipidameia
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width >= 600
                                            ? 350
                                            : double.infinity),
                                padding: const EdgeInsets.all(16),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Patient\'s Allergies',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Food Allergy: '),
                                            Text(medicalHistory.foodAllergy
                                                ? medicalHistory.foodAllergyList
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Medicine Allergy: '),
                                            Text(medicalHistory.medicineAllergy
                                                ? medicalHistory
                                                    .medicineAllergyList
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Anesthesia Allergy: '),
                                            Text(
                                                medicalHistory.anesthesiaAllergy
                                                    ? "Yes"
                                                    : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width >= 600
                                            ? 350
                                            : double.infinity),
                                padding: const EdgeInsets.all(16),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Patient\'s Medication History',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                                'Any Prescribed medicine: '),
                                            Expanded(
                                              child: Text(
                                                medicalHistory
                                                        .prescribedMedicine
                                                    ? medicalHistory
                                                        .prescribedMedicineList
                                                    : 'No',
                                                maxLines: 4,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                                'Any self prescribed medicine: '),
                                            Expanded(
                                              child: Text(
                                                medicalHistory
                                                        .selfPrescribedMedicine
                                                    ? medicalHistory
                                                        .selfMedicineList
                                                    : 'No',
                                                maxLines: 4,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width >= 600
                                            ? 350
                                            : double.infinity),
                                padding: const EdgeInsets.all(16),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Patient\'s Health Condition',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Heart Condition: '),
                                            Text(medicalHistory.heart
                                                ? medicalHistory.heartDiseases
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Mental Condition: '),
                                            Text(medicalHistory.mental
                                                ? medicalHistory.mentalHealth
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Chest Condition: '),
                                            Text(medicalHistory.chest
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Epilepsy Condition: '),
                                            Text(medicalHistory.epilepsy
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                                'Bone/joint Condition: '),
                                            Text(medicalHistory.bone
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width >= 600
                                            ? 350
                                            : double.infinity),
                                padding: const EdgeInsets.all(16),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Patient\'s Addictions and Infections',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('HIV: '),
                                            Text(medicalHistory.hiv
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Hepatitis B: '),
                                            Text(medicalHistory.hepatitisB
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Hepatitis C: '),
                                            Text(medicalHistory.hepatitisC
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Alcohol: '),
                                            Text(medicalHistory.alcohol
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Tobacoo: '),
                                            Text(medicalHistory.tobacco
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Drugs: '),
                                            Text(medicalHistory.drugs
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width >= 600
                                            ? 350
                                            : double.infinity),
                                padding: const EdgeInsets.all(16),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Patient\'s Miscellaneous Information',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Family diseases: '),
                                            Text(medicalHistory.geneticDiseases
                                                ? medicalHistory
                                                    .geneticDiseasesList
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                                'Pregnant/been pregnant: '),
                                            Text(medicalHistory.pregnant
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Lumps in body: '),
                                            Text(medicalHistory.lumps
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                                'Cancer Patient/Survivor: '),
                                            Text(medicalHistory.cancer
                                                ? 'Yes'
                                                : 'No'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
