@isTest
private class CollectionLibraryTest {
  static Integer seed = 0;

  @isTest
  static void testGetListofIdsInputListOk() {
    Test.startTest();
    List<Id> listOfIds = CollectionLibrary.getListOfIds(buildListOfAccounts());
    Test.stopTest();
    System.assertEquals(10, listOfIds.size(), 'Not proper size of List');
  }

  @isTest
  static void testGetListofIdsInputListFieldEmpty() {
    Test.startTest();
    List<Id> listOfIds = CollectionLibrary.getListOfIds(new List<Account>());
    Test.stopTest();
    System.assert(listOfIds.isEmpty(), 'Not empty list');
  }

  @isTest
  static void testGetListofIdsInputListFieldOk() {
    Test.startTest();
    List<Id> listOfIds = CollectionLibrary.getListOfIds(buildListOfAccounts(), Account.OwnerId);
    Test.stopTest();
    System.assertEquals(10, listOfIds.size(), 'Not proper size of List');
  }

  @isTest
  static void testGetListofIdsInputListFieldWrongField() {
    Exception ex;
    Test.startTest();
    try {
      List<Id> listOfIds = CollectionLibrary.getListOfIds(buildListOfAccounts(), Account.Name);
    } catch (Exception e) {
      ex = e;
    }
    Test.stopTest();
    System.assertNotEquals(null, ex, 'No exception thrown');
    System.assertEquals('CollectionLibrary.InnerException', ex.getTypeName(), 'Exception type does not match');
    System.assertEquals('Name is not of valid type', ex.getMessage(), 'Error message does not match');
  }

  @isTest
  static void testGetListofStringsOk() {
    Test.startTest();
    List<String> listOfStrings = CollectionLibrary.getListOfStrings(buildListOfAccounts(), Account.Name);
    Test.stopTest();
    System.assertEquals(10, listOfStrings.size(), 'Not proper size of List');
  }

  @isTest
  static void testGetListofStringsWrongField() {
    Exception ex;
    Test.startTest();
    try {
      List<String> listOfIds = CollectionLibrary.getListOfStrings(buildListOfAccounts(), Account.NumberOfEmployees);
    } catch (Exception e) {
      ex = e;
    }
    Test.stopTest();
    System.assertNotEquals(null, ex, 'No exception thrown');
    System.assertEquals('CollectionLibrary.InnerException', ex.getTypeName(), 'Exception type does not match');
    System.assertEquals('NumberOfEmployees is not of valid type', ex.getMessage(), 'Error message does not match');
  }

  @isTest
  static void testGetMapInputListOk() {
    Test.startTest();
    Map<Id, SObject> mapOfAccounts = CollectionLibrary.getMap(buildListOfAccounts());
    Test.stopTest();
    System.assertEquals(10, mapOfAccounts.size(), 'Not proper size of Map');
  }

  @isTest
  static void testGetMapInputListEmpty() {
    Test.startTest();
    Map<Id, SObject> mapOfObjects = CollectionLibrary.getMap(new List<Account>());
    Test.stopTest();
    System.assert(mapOfObjects.isEmpty(), 'Not empty map');
  }

  @isTest
  static void testGetMapInputListFieldOk() {
    Test.startTest();
    Map<Id, SObject> mapOfAccounts = CollectionLibrary.getMap(buildListOfAccounts(), Account.OwnerId);
    Test.stopTest();
    System.assertEquals(10, mapOfAccounts.size(), 'Not proper size of Map');
  }

  @isTest
  static void testGetMapInputListFieldWrongField() {
    Exception ex;
    Test.startTest();
    try {
      Map<Id, SObject> mapOfAccounts = CollectionLibrary.getMap(buildListOfAccounts(), Account.Name);
    } catch (Exception e) {
      ex = e;
    }
    Test.stopTest();
    System.assertNotEquals(null, ex, 'No exception thrown');
    System.assertEquals('CollectionLibrary.InnerException', ex.getTypeName(), 'Exception type does not match');
    System.assertEquals('Name is not of valid type', ex.getMessage(), 'Error message does not match');
  }

  @isTest
  static void testGetMapByStringOk() {
    Test.startTest();
    Map<String, SObject> mapOfAccounts = CollectionLibrary.getMapByString(buildListOfAccounts(), Account.Name);
    Test.stopTest();
    System.assertEquals(10, mapOfAccounts.size(), 'Not proper size of Map');
  }

  @isTest
  static void testGetMapByStringWrongField() {
    Exception ex;
    Test.startTest();
    try {
      Map<String, SObject> mapOfAccounts = CollectionLibrary.getMapByString(
        buildListOfAccounts(),
        Account.NumberOfEmployees
      );
    } catch (Exception e) {
      ex = e;
    }
    Test.stopTest();
    System.assertNotEquals(null, ex, 'No exception thrown');
    System.assertEquals('CollectionLibrary.InnerException', ex.getTypeName(), 'Exception type does not match');
    System.assertEquals('NumberOfEmployees is not of valid type', ex.getMessage(), 'Error message does not match');
  }

  @isTest
  static void testGetMapOfIdsOk() {
    Test.startTest();
    Map<Id, Id> mapOfIds = CollectionLibrary.getMapOfIds(buildListOfAccounts(), Account.Id, Account.OwnerId);
    Test.stopTest();
    System.assertEquals(10, mapOfIds.size(), 'Not proper size of Map');
  }

  @isTest
  static void testGetMapOfIdsWrongKey() {
    Exception ex;
    Test.startTest();
    try {
      Map<Id, Id> mapOfIds = CollectionLibrary.getMapOfIds(buildListOfAccounts(), Account.Name, Account.OwnerId);
    } catch (Exception e) {
      ex = e;
    }
    Test.stopTest();
    System.assertNotEquals(null, ex, 'No exception thrown');
    System.assertEquals('CollectionLibrary.InnerException', ex.getTypeName(), 'Exception type does not match');
    System.assertEquals('Name is not of valid type', ex.getMessage(), 'Error message does not match');
  }

  @isTest
  static void testGetMapOfIdsWrongValue() {
    Exception ex;
    Test.startTest();
    try {
      Map<Id, Id> mapOfIds = CollectionLibrary.getMapOfIds(
        buildListOfAccounts(),
        Account.Id,
        Account.NumberOfEmployees
      );
    } catch (Exception e) {
      ex = e;
    }
    Test.stopTest();
    System.assertNotEquals(null, ex, 'No exception thrown');
    System.assertEquals('CollectionLibrary.InnerException', ex.getTypeName(), 'Exception type does not match');
    System.assertEquals('NumberOfEmployees is not of valid type', ex.getMessage(), 'Error message does not match');
  }

  @isTest
  static void testGetSetOfIdsInputListOk() {
    Test.startTest();
    Set<Id> setOfIds = CollectionLibrary.getSetofIds(buildListOfAccounts());
    Test.stopTest();
    System.assertEquals(10, setOfIds.size(), 'Not proper size of Set');
  }

  @isTest
  static void testGetSetOfIdsInputListFieldOk() {
    Test.startTest();
    Set<Id> setOfIds = CollectionLibrary.getSetofIds(buildListOfAccounts(), Account.OwnerId);
    Test.stopTest();
    System.assertEquals(10, setOfIds.size(), 'Not proper size of Set');
  }

  @isTest
  static void testGetSetOfStringsOk() {
    Test.startTest();
    Set<String> setOfStrings = CollectionLibrary.getSetofStrings(buildListOfAccounts(), Account.Name);
    Test.stopTest();
    System.assertEquals(10, setOfStrings.size(), 'Not proper size of Set');
  }

  @isTest
  static void testGetMapOfListsOK() {
    List<Account> listOfAccounts = buildListOfAccounts();
    Integer i = 0;
    for (Account acc : listOfAccounts) {
      acc.BillingCity = 'Ciudad ' + String.valueOf(Math.mod(++i, 3));
      System.debug(acc);
    }
    Test.startTest();
    Map<String, List<SObject>> mapOfLists = CollectionLibrary.getMapOfLists(listOfAccounts, Account.BillingCity);
    Test.stopTest();
    System.assertEquals(3, mapOfLists.size(), 'Not proper size of Set');
  }

  @isTest
  static void testGetMapOfListsWrongField() {
    Exception ex;
    Test.startTest();
    try {
      Map<String, List<SObject>> mapOfLists = CollectionLibrary.getMapOfLists(
        buildListOfAccounts(),
        Account.NumberOfEmployees
      );
    } catch (Exception e) {
      ex = e;
    }
    Test.stopTest();
    System.assertNotEquals(null, ex, 'No exception thrown');
    System.assertEquals('CollectionLibrary.InnerException', ex.getTypeName(), 'Exception type does not match');
    System.assertEquals('NumberOfEmployees is not of valid type', ex.getMessage(), 'Error message does not match');
  }

  private static List<Account> buildListOfAccounts() {
    List<Account> listOfAccounts = new List<Account>();
    for (Integer i = 0; i < 10; i++) {
      listOfAccounts.add(
        new Account(
          Id = createId(Account.sObjectType),
          Name = 'Test Account ' + String.valueOf(i),
          NumberOfEmployees = seed,
          OwnerId = createId(User.sObjectType)
        )
      );
    }
    return listOfAccounts;
  }

  private static Id createId(SObjectType baseSobjectType) {
    seed++;
    return baseSobjectType.getDescribe().getKeyPrefix() + String.valueOf(seed).leftPad(12, '0');
  }
}
