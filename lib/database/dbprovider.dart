import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:ui/database/dbMethods/applicationDetailsdb.dart';
import 'package:ui/database/dbMethods/contactDetailsdb.dart';
import 'package:ui/database/dbMethods/workDetailsdb.dart';
import 'package:ui/database/dbMethods/documentDetailsdb.dart';
import 'package:ui/database/dbMethods/parentDetailsdb.dart';
import 'package:ui/database/dbMethods/applicationFeePaymentdb.dart';
import 'package:ui/database/dbMethods/personalInformationdb.dart';
import 'package:ui/database/dbMethods/qualificationDetailsdb.dart';
import 'package:ui/database/createTables.dart';
import 'package:ui/models/applicationDetails.dart';
import 'package:ui/models/contactDetails.dart';
import 'package:ui/models/documentDetails.dart';
import 'package:ui/models/parentDetails.dart';
import 'package:ui/models/applicationFeePayment.dart';
import 'package:ui/models/personalInformation.dart';
import 'package:ui/models/qualificationDetails.dart';
import 'package:ui/models/workDetails.dart';

import 'package:ui/models/user.dart';
import 'package:ui/database/dbMethods/userdb.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory dp = await getApplicationDocumentsDirectory();
    return await openDatabase(
      join(dp.path, 'UI.db'),
      onCreate: (db, version) async {
        await createTables(db);
      },
      version: 1,
    );
  }
  // DATABASE METHODS FOR ALL OF THE APP

//USER DB METHODS
  Future<int> newUser(User newUser) async =>
      await newUserFunc(newUser: newUser, database: database);
  Future<User> getUser(int userId) async =>
      await getUserFunc(userId: userId, database: database);
  Future<bool> checkUser(String email) async =>
      await checkUserFunc(userEmail: email, database: database);
  Future<int> signIn(User user) async =>
      await signInFunc(user: user, database: database);

//APPLICATION DETAILS DB METHODS
  Future<int> saveApplicationDetails(ApplicationDetails application) async =>
      await saveApplicationDetailsFunc(
          newApplication: application, database: database);
  Future<ApplicationDetails> getApplicationDetails(int applicationId) async =>
      await getApplicationDetailsFunc(
          applicationDetailsId: applicationId, database: database);
  Future<List<ApplicationDetails>> getAllApplicationDetails() async =>
      await getAllApplicationDetailsFunc(database: database);
  Future<int> updateApplicationDetails(ApplicationDetails info) async =>
      await updateApplicationDetailsFunc(info: info, database: database);
  Future<int> deleteApplicationDetails(int applicationDetailsId) async =>
      await deleteApplicationDetailsFunc(
          applicationDetailsId: applicationDetailsId, database: database);

//CONTACT DETAILS DB METHODS
  Future<int> saveContactDetails(ContactDetails contact) async =>
      await saveContactDetailsFunc(newContact: contact, database: database);
  Future<ContactDetails> getContactDetails(int contactId) async =>
      await getContactDetailsFunc(
          contactDetailsId: contactId, database: database);
  Future<List<ContactDetails>> getAllContactDetails() async =>
      await getAllContactDetailsFunc(database: database);
  Future<int> updateContactDetails(ContactDetails info) async =>
      await updateContactDetailsFunc(info: info, database: database);
  Future<int> deleteContactDetails(int contactDetailsId) async =>
      await deleteContactDetailsFunc(
          contactDetailsId: contactDetailsId, database: database);

//DOCUMENT DETAIL DB METHODS
  Future<int> saveDocumentDetails(DocumentDetails document) async =>
      await saveDocumentDetailsFunc(newDocument: document, database: database);
  Future<DocumentDetails> getDocumentDetails(int documentId) async =>
      await getDocumentDetailsFunc(
          documentDetailsId: documentId, database: database);
  Future<List<DocumentDetails>> getAllDocumentDetails() async =>
      await getAllDocumentDetailsFunc(database: database);
  Future<int> updateDocumentDetails(DocumentDetails info) async =>
      await updateDocumentDetailsFunc(info: info, database: database);
  Future<int> deleteDocumentDetails(int documentDetailsId) async =>
      await deleteDocumentDetailsFunc(
          documentDetailsId: documentDetailsId, database: database);

//PARENT DETAILS DB METHODS
  Future<int> saveParentDetails(ParentDetails parent) async =>
      await saveParentDetailsFunc(newParent: parent, database: database);
  Future<ParentDetails> getParentDetails(int parentId) async =>
      await getParentDetailsFunc(parentDetailsId: parentId, database: database);
  Future<List<ParentDetails>> getAllParentDetails() async =>
      await getAllParentDetailsFunc(database: database);
  Future<int> updateParentDetails(ParentDetails info) async =>
      await updateParentDetailsFunc(info: info, database: database);
  Future<int> deleteParentDetails(int parentDetailsId) async =>
      await deleteParentDetailsFunc(
          parentDetailsId: parentDetailsId, database: database);

//QUALIFICATION DETAILS DB METHODS
  Future<int> saveQualificationDetails(
          QualificationDetails qualification) async =>
      await saveQualificationDetailsFunc(
          newQualification: qualification, database: database);
  Future<QualificationDetails> getQualificationDetails(
          int qualificationId) async =>
      await getQualificationDetailsFunc(
          qualificationDetailsId: qualificationId, database: database);
  Future<List<QualificationDetails>> getAllQualificationDetails() async =>
      await getAllQualificationDetailsFunc(database: database);
  Future<int> updateQualificationDetails(QualificationDetails info) async =>
      await updateQualificationDetailsFunc(info: info, database: database);
  Future<int> deleteQualificationDetails(int qualificationDetailsId) async =>
      await deleteQualificationDetailsFunc(
          qualificationDetailsId: qualificationDetailsId, database: database);

//WORK DETAILS DB METHODS
  Future<int> saveWorkDetails(WorkDetails work) async =>
      await saveWorkDetailsFunc(newWork: work, database: database);
  Future<WorkDetails> getWorkDetails(int workId) async =>
      await getWorkDetailsFunc(workDetailsId: workId, database: database);
  Future<List<WorkDetails>> getAllWorkDetails() async =>
      await getAllWorkDetailsFunc(database: database);
  Future<int> updateWorkDetails(WorkDetails info) async =>
      await updateWorkDetailsFunc(info: info, database: database);
  Future<int> deleteWorkDetails(int workDetailsId) async =>
      await deleteWorkDetailsFunc(
          workDetailsId: workDetailsId, database: database);

//APPLICAITON FEE PAYMENT DB METHODS
  Future<int> saveApplicationFeePayment(
          ApplicationFeePayment applicationFeePayment) async =>
      await saveApplicationFeePaymentFunc(
          newDocument: applicationFeePayment, database: database);
  Future<ApplicationFeePayment> getApplicationFeePayment(
          int applicationFeePaymentId) async =>
      await getApplicationFeePaymentFunc(
          applicationFeePaymentId: applicationFeePaymentId, database: database);
  Future<List<ApplicationFeePayment>> getAllApplicationFeePayment() async =>
      await getAllApplicationFeePaymentFunc(database: database);
  Future<int> updateApplicationFeePayment(ApplicationFeePayment info) async =>
      await updateApplicationFeePaymentFunc(info: info, database: database);
  Future<int> deleteApplicationFeePayment(int applicationFeePaymentId) async =>
      await deleteApplicationFeePaymentFunc(
          applicationFeePaymentId: applicationFeePaymentId, database: database);

//PERSONAL INFORMATION DB METHODS
  Future<int> savePersonalInformation(
          PersonalInformation personalInformation) async =>
      await savePersonalInformationFunc(
          newPersonal: personalInformation, database: database);
  Future<PersonalInformation> getPersonalInformation(
          int personalInformationId) async =>
      await getPersonalInformationFunc(
          personalInformationId: personalInformationId, database: database);
  Future<List<PersonalInformation>> getAllPersonalInformation() async =>
      await getAllPersonalInformationFunc(database: database);
  Future<int> updatePersonalInformation(PersonalInformation info) async =>
      await updatePersonalInformationFunc(info: info, database: database);
  Future<int> deletePersonalInformation(int personalInformationId) async =>
      await deletePersonalInformationFunc(
          personalInformationId: personalInformationId, database: database);
}
