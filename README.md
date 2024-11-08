Paper BTC Wallet Generator

Paper BTC Wallet Generator is a Flutter-based application that allows users to generate secure Bitcoin paper wallets with customizable, attractive designs. This project includes a backend service, built with the Dart Angel framework, to securely handle Bitcoin key generation and management. This app is perfect for secure cold storage, Bitcoin gifting, or introducing friends and family to cryptocurrency in a tangible way.
Features

    Generate Bitcoin Wallets – Create Bitcoin addresses and private keys in a secure environment.
    Stylish Paper Templates – Customize your wallet design with beautiful paper wallet templates.
    Dart Angel Backend – Secure server-side wallet generation using the Angel framework.
    Easy Printing – Print your wallet for a physical, offline storage solution.

Project Structure

This project consists of two parts:

    Flutter Frontend: The main app interface for generating and customizing Bitcoin paper wallets. Repository link
    Dart Angel Backend: A secure backend service for key generation, designed with the Dart Angel framework. Repository link

Getting Started
Prerequisites

    Flutter SDK – required to run the frontend.
    Dart SDK – required for both the Flutter frontend and Angel backend.
    Angel CLI – for managing and running the backend service.

Installation
1. Clone the Repositories

Clone both the frontend and backend repositories:

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

In the backend directory, start the server:

angel serve

Ensure the backend service is running locally or on a server accessible to the Flutter app.
4. Run the Flutter App

Return to the frontend directory and run the app on your preferred emulator or connected device:

flutter run

Usage

    Open the app and follow the instructions to generate a new Bitcoin wallet.
    Customize the wallet template as desired.
    Print your wallet for secure offline storage.

    ⚠️ Important: Store the printed wallet securely, as the private key allows access to the Bitcoin funds.

Contributing

Contributions are welcome! Please feel free to submit pull requests for new templates, features, or improvements.
License

This project is licensed under the MIT License. See the LICENSE file for details.
