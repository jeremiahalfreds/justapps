import 'package:flutter/material.dart';

// Home page
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0),
            child: Text(
              'Payment',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          // Row of Action Cards
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200, // light bg
                      foregroundColor: Colors.black, // text + icon color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40), // pill shape
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.south_west), // ↙ icon
                    label: const Text("Receive"),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // dark bg
                      foregroundColor: Colors.white, // text + icon color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40), // pill shape
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.north_east), // ↗ icon
                    label: const Text("Send"),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Transactions',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          // Transactions Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.history, color: Colors.teal),
              title: const Text("Recent Transactions"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to transactions
              },
            ),
          ),
          const SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            child: ListTile(
              leading: const Icon(
                Icons.account_balance_wallet,
                color: Colors.deepPurple,
              ),
              title: const Text("My Wallets"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to wallets
              },
            ),
          ),
        ],
      ),
    );
  }
}
