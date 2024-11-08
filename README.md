🪙 Paper BTC Wallet Generator

Paper BTC Wallet Generator is a Flutter-based application that enables users to create secure, attractive Bitcoin paper wallets. The app includes a secure backend service built with the Dart Angel framework, making it ideal for cold storage, Bitcoin gifting, or introducing friends and family to cryptocurrency in a tangible way.
✨ Features

    Generate Bitcoin Wallets – Create Bitcoin addresses and private keys in a secure environment.
    Customizable Paper Templates – Choose from a variety of stylish wallet designs.
    Secure Dart Angel Backend – Server-side wallet generation using the Angel framework for enhanced security.
    Print-Ready Design – Easily print your wallet for secure, offline Bitcoin storage.

📁 Project Structure

This project includes two components:

    Flutter Frontend: The main app interface for generating and customizing Bitcoin paper wallets.
    Frontend Repository

    Dart Angel Backend: A secure backend service built for key generation with the Dart Angel framework.
    Backend Repository

🚀 Getting Started
Prerequisites

    Flutter SDK – Required to run the frontend.
    Dart SDK – Required for both the frontend and backend.
    Angel CLI – For managing and running the backend service.

Installation
1. Clone the Repositories

Clone the frontend repository:

git clone https://github.com/TOMSLAUS/paper_wallet_generator.git
cd paper_wallet_generator

Then clone the backend:

git clone https://github.com/TOMSLAUS/BTC_Backend.git
cd BTC_Backend

2. Install Dependencies

For the Flutter frontend:

flutter pub get

For the backend, navigate to the backend directory and install dependencies:

cd BTC_Backend
dart pub get

3. Run the Backend Service

In the backend directory, start the Angel server:

angel serve

Ensure the backend service is running locally or on a server accessible to the Flutter app.
4. Run the Flutter App

Return to the frontend directory and run the app on your preferred emulator or device:

flutter run

🎉 Usage

    Open the app and follow the prompts to generate a new Bitcoin wallet.
    Customize your wallet with a preferred template design.
    Print your wallet for secure offline storage.

    ⚠️ Important: Store the printed wallet securely, as the private key provides full access to your Bitcoin funds.

🤝 Contributing

We welcome contributions! Please feel free to submit pull requests for new templates, features, or improvements.
📜 License

This project is licensed under the MIT License. See the LICENSE file for details.
