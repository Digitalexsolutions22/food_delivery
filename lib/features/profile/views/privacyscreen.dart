import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:food_delivery/constants/colors.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    const String privacyPolicyHtml = """
<h1>Privacy Policy</h1>

<h2>1. Introduction</h2>
<p>
Welcome to <strong>Food Delivery App</strong>! Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal information when you use our app to browse restaurants, place food orders, and enjoy timely deliveries.
</p>

<h2>2. Information We Collect</h2>
<ul>
  <li>Full Name</li>
  <li>Phone Number</li>
  <li>Email Address</li>
  <li>Delivery Address</li>
  <li>Payment Details (processed via secure third-party services)</li>
  <li>Order History and Preferences</li>
  <li>Device and Usage Information</li>
  <li>Location Data (for delivery and nearby services)</li>
</ul>

<h2>3. How We Use Your Information</h2>
<p>We use your information to:</p>
<ul>
  <li>Allow you to search and order food from restaurants</li>
  <li>Process and deliver your food orders</li>
  <li>Send order updates and delivery notifications</li>
  <li>Provide customer support and resolve issues</li>
  <li>Recommend personalized dishes or offers</li>
  <li>Improve our app performance and user experience</li>
</ul>

<h2>4. Sharing Your Information</h2>
<p>
We <strong>do not sell</strong> your data. We may share your information with:
</p>
<ul>
  <li>Delivery partners (to deliver your order)</li>
  <li>Restaurant partners (to prepare your food)</li>
  <li>Payment gateways (to process secure payments)</li>
  <li>Service providers (for analytics, notifications, and app performance)</li>
</ul>

<h2>5. Data Security</h2>
<p>
We use industry-standard security practices to protect your data. However, no method of data transmission over the internet is fully secure.
</p>

<h2>6. Your Rights</h2>
<p>You have the right to:</p>
<ul>
  <li>Access and update your account information</li>
  <li>Delete your account or request deletion of personal data</li>
  <li>Opt out of marketing communications</li>
</ul>
<p>To exercise your rights, contact us at <strong>[your email]</strong>.</p>

<h2>7. Children’s Privacy</h2>
<p>
Our services are not intended for children under 13. We do not knowingly collect personal data from minors.
</p>

<h2>8. Changes to This Policy</h2>
<p>
We may update this Privacy Policy from time to time. Updates will be available within the app along with the revision date.
</p>

<h2>9. Contact Us</h2>
<p>
If you have any questions or concerns, reach out to us at:<br>
<strong>Email:</strong> support@fooddeliveryapp.com<br>
<strong>Phone:</strong> +91-9000000000
</p>
""";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: AppColors.orange,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  const Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border.all(color: AppColors.black.withAlpha(50)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: HtmlWidget(
                    privacyPolicyHtml,
                    textStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
