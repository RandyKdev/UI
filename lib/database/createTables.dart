import 'package:sqflite/sqflite.dart';
import './nameConstants.dart';

Future<void> createTables(Database db) async {
  await db.execute('''
       CREATE TABLE $userTable (
         $id INTEGER PRIMARY KEY, $email TEXT, $username TEXT, $password TEXT
       )
      ''');
  await db.execute('''
       CREATE TABLE $personalInformationTable (
         $id INTEGER PRIMARY KEY, $profileTitle TEXT, $firstName TEXT, $middleName TEXT,
      $lastName TEXT, $gender TEXT, $birthPlace TEXT, $dateOfBirth TEXT,
      $nationality TEXT, $bloodGroup TEXT, $motherTongue TEXT, $religion TEXT,
      $currentQualification TEXT,
       )
      ''');
  await db.execute('''
      CREATE TABLE $workDetailTable (
        $id INTEGER PRIMARY KEY, $company TEXT, $role TEXT, $workDescription MEDIUMTEXT,
        $program TEXT, $endDate DATE, $startDate DATE
      )
      ''');
  await db.execute('''
      CREATE TABLE $qualificationDetailTable (
        $id INTEGER PRIMARY KEY, $institution TEXT, $qualification TEXT, $relatedAcademicProgram TEXT,
        $endDate DATE, $startDate DATE
      )
      ''');
  await db.execute('''
      CREATE TABLE $parentDetailTable (
        $id INTEGER PRIMARY KEY, $fullNames TEXT, $relation TEXT, $education TEXT, $occupation TEXT,
        $address TEXT, $nationality TEXT, $stateOrRegion TEXT, $city TEXT, $email TEXT, $phone INTEGER,
        $mobile INTEGER
      )
      ''');
  await db.execute('''
      CREATE TABLE $documentDetailTable (
        $id INTEGER PRIMARY KEY, $documentTitle TEXT, $document BLOB, $relatedAcademicProgram TEXT
      )
      ''');
  await db.execute('''
      CREATE TABLE $contactDetailTable (
        $id INTEGER PRIMARY KEY, $presentAddress TEXT, $permanentAddress TEXT, $country TEXT,
        $stateOrRegion TEXT, $city TEXT, $email TEXT, $phone INTEGER, $mobile INTEGER
      )
      ''');
  await db.execute('''
      CREATE TABLE $applicationFeePaymentTable (
        $id INTEGER PRIMARY KEY, $amount FLOAT(25), $momoNumber INTEGER, $bankReceipt BLOB,
        $referenceNumber INTEGER
      )
      ''');
  await db.execute('''
      CREATE TABLE $applicationDetailTable (
        $id INTEGER PRIMARY KEY, $campus TEXT, $program TEXT, $profile TEXT, $studyMode TEXT,
        $admissionType TEXT, $startDate DATE, $endDate DATE, 
      )
      ''');
}
