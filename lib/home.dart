// Fareed 12032192
// CSCI410 Mobile Application Project 1

import 'package:flutter/material.dart';
import 'pricing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedService;

  bool styling = false;
  bool faceMask = false;

  int totalPrice = 0;
  int totalTime = 0;

  void calculate() {
    final result = Pricing.calculatePrice(
      mainService: selectedService,
      styling: styling,
      faceMask: faceMask,
    );

    setState(() {
      totalPrice = result["price"]!;
      totalTime = result["time"]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool addonsEnabled = selectedService != "Full Service";

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("Haircut Price Estimator"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Main Service",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            DropdownButtonFormField(
              initialValue: selectedService,
              hint: const Text("Choose a service"),
              items: const [
                DropdownMenuItem(
                    value: "Haircut", child: Text("Haircut — \$10")),
                DropdownMenuItem(
                    value: "Beard", child: Text("Beard — \$5")),
                DropdownMenuItem(
                    value: "Full Service",
                    child: Text("Full Service — \$15")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedService = value;

                  if (value == "Full Service") {
                    styling = false;
                    faceMask = false;
                  }
                });
              },
            ),

            const SizedBox(height: 30),

            const Text(
              "Add-ons (Included by default for full service without any additional fees)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SwitchListTile(
              title: const Text("Styling — \$5"),
              value: styling,
              onChanged: addonsEnabled
                  ? (v) => setState(() => styling = v)
                  : null,
            ),

            SwitchListTile(
              title: const Text("Face Mask — \$5"),
              value: faceMask,
              onChanged: addonsEnabled
                  ? (v) => setState(() => faceMask = v)
                  : null,
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12)),
                onPressed: calculate,
                child: const Text(
                  "Calculate",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 30),

            if (totalPrice > 0)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      "Total Price: \$${totalPrice}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Estimated Time: $totalTime minutes",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
