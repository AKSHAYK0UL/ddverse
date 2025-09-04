# DDverse-Project

<h1>State Management Approach: BLoC</h1>

<p>This project uses <strong>BLoC</strong> for state management, following the BLoC pattern. The architecture is organized into the following layers:</p>

<ul>
  <li><strong>Repository Layer:</strong> Converts raw data to models/objects.</li>
  <li><strong>Network Layer:</strong> Manages API calls and network communications.</li>
  <li><strong>Model Layer:</strong> Defines the data structures.</li>
  <li><strong>BLoC Layer:</strong> Contains business logic and state management.</li>
  <li><strong>UI Layer:</strong> Renders the interface and reacts to state changes.</li>
</ul>

<h2>Setup and Installation</h2>
<ol>
  <li>
    <strong>Install Flutter:</strong> Ensure you have Flutter installed by following the 
    <a href="https://flutter.dev/docs/get-started/install" target="_blank">official installation guide</a>.
  </li>
  <li>
    <strong>Clone the Repository:</strong> Open your terminal and run:
    <pre>git clone https://github.com/AKSHAYK0UL/ddverse.git</pre>
  </li>
  <li>
    <strong>Navigate to the Project Directory:</strong>
    <pre>cd ddverse</pre>
  </li>
  <li>
    <strong>Install Dependencies:</strong> Run the following command to fetch all dependencies:
    <pre>flutter pub get</pre>
  </li>
  <li>
    <strong>Run the Application:</strong> Start your app using:
    <pre>flutter run</pre>
  </li>
</ol>

<h2>Firebase Setup</h2>
<p>Follow these steps to set up Firebase Authentication and Cloud Firestore using the FlutterFire CLI:</p>
<ol>
  <li>
    <strong>Login to Firebase:</strong> Authenticate your Firebase account by running:
    <pre>firebase login</pre>
  </li>
  <li>
    <strong>Activate FlutterFire CLI:</strong> Install the FlutterFire CLI globally:
    <pre>dart pub global activate flutterfire_cli</pre>
  </li>
  <li>
    <strong>Configure Firebase in Your Project:</strong> Run the following command in your project directory:
    <pre>flutterfire configure</pre>
    This command links your Flutter project to your Firebase project and generates the necessary configuration files.
  </li>
</ol>
