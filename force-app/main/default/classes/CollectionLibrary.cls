/**
 * @description Collection Utility
 */
public with sharing class CollectionLibrary {
  static Set<Schema.DisplayType> validIdFieldTypes = new Set<Schema.DisplayType>{
    Schema.DisplayType.ID,
    Schema.DisplayType.DATACATEGORYGROUPREFERENCE,
    Schema.DisplayType.REFERENCE
  };

  static Set<Schema.DisplayType> validStringFieldTypes = new Set<Schema.DisplayType>{
    Schema.DisplayType.PICKLIST,
    Schema.DisplayType.STRING,
    Schema.DisplayType.TEXTAREA
  };

  /**
   * @description Verifies if valid Id field
   * @param  field field name
   * @return       true if valid Id
   */
  private static Boolean isValidIdField(SObjectField field) {
    return validIdFieldTypes.contains(field.getDescribe().getType());
  }
  private static Boolean isValidStringField(SObjectField field) {
    return validStringFieldTypes.contains(field.getDescribe().getType());
  }
  /**
   * @description Extracts an Id List
   * @param  inputList SObject List
   * @return           Id List
   */
  public static List<Id> getListOfIds(List<SObject> inputList) {
    return new List<Id>(getSetofIds(inputList));
  }
  /**
   * @description Extracts an Id List, based on a given field
   * @param  inputList SObject List
   * @param  field     Key field
   * @return           Id List from key field
   */
  public static List<Id> getListOfIds(List<SObject> inputList, SObjectField field) {
    List<Id> listOfIds = new List<Id>();
    String fieldName = field.getDescribe().getName();
    if (!isValidIdField(field)) {
      throw new InnerException(fieldName + ' is not of valid type');
    }
    for (SObject o : inputList) {
      listOfIds.add((Id) o?.get(fieldName));
    }
    return listOfIds;
  }
  /**
   * @description Extracts a String List, based on a given field
   * @param  inputList Sobject List
   * @param  field     Key field
   * @return           String List from key field
   */
  public static List<String> getListOfStrings(List<SObject> inputList, SObjectField field) {
    List<String> listOfStrings = new List<String>();
    String fieldName = field.getDescribe().getName();
    if (!isValidStringField(field)) {
      throw new InnerException(fieldName + ' is not of valid type');
    }
    for (SObject o : inputList) {
      listOfStrings.add((String) o?.get(fieldName));
    }
    return listOfStrings;
  }
  /**
   * @description Creates an SObject Map
   * @param  inputList Sobject List
   * @return           Sobject Map with id as key
   */
  public static Map<Id, SObject> getMap(List<SObject> inputList) {
    return inputList.isEmpty() ? new Map<Id, SObject>() : new Map<Id, SObject>(inputList);
  }
  /**
   * @description Creates an SObject Map, based on a key Id field
   * @param  inputList Sobject List
   * @param  field     key field
   * @return           Sobject Map using key field
   */
  public static Map<Id, SObject> getMap(List<SObject> inputList, SObjectField field) {
    if (!isValidIdField(field)) {
      throw new InnerException(field.getDescribe().getName() + ' is not of valid type');
    }
    Map<Id, SObject> returnMap = new Map<Id, SObject>();
    Map<String, SObject> internalMap = getMapByString(inputList, field);
    for (String key : internalMap.keySet()) {
      returnMap.put((Id) key, internalMap.get(key));
    }
    return returnMap;
  }
  /**
   * @description Creates SObject Map, based on a key String field
   * @param  inputList Sobject List
   * @param  field     key field
   * @return           Sobject map, keys are String values from field
   */
  public static Map<String, SObject> getMapByString(List<SObject> inputList, SObjectField field) {
    Map<String, SObject> returnMap = new Map<String, SObject>();
    String fieldName = field.getDescribe().getName();
    if (inputList.isEmpty()) {
      return returnMap;
    }
    if (!isValidStringField(field) && !isValidIdField(field)) {
      throw new InnerException(fieldName + ' is not of valid type');
    }
    for (SObject o : inputList) {
      returnMap.put((String) o?.get(fieldName), o);
    }
    return returnMap;
  }
  /**
   * @description Creates Id Map, based on key / value fields
   * @param  inputList Sobject List
   * @param  key       key field
   * @param  value     value Field
   * @return           Id map, using key field
   */
  public static Map<Id, Id> getMapOfIds(List<SObject> inputList, SObjectField key, SObjectField value) {
    Map<Id, Id> returnMap = new Map<Id, Id>();
    String keyName = key.getDescribe().getName();
    String valueName = value.getDescribe().getName();
    if (!isValidIdField(key)) {
      throw new InnerException(keyName + ' is not of valid type');
    }
    if (!isValidIdField(value)) {
      throw new InnerException(valueName + ' is not of valid type');
    }
    for (SObject o : inputList) {
      returnMap.put((Id) o?.get(keyName), (Id) o?.get(valueName));
    }
    return returnMap;
  }
  /**
   * @description Creates List Map, based on String
   * @param  inputList Sobject List
   * @param  field     key field
   * @return           List map, using key field
   */
  public static Map<String, List<SObject>> getMapOfLists(List<SObject> inputList, SobjectField field) {
    Map<String, List<SObject>> returnMap = new Map<String, List<SObject>>();
    String fieldName = field.getDescribe().getName();
    if (!isValidStringField(field) && !isValidIdField(field)) {
      throw new InnerException(fieldName + ' is not of valid type');
    }
    for (SObject o : inputList) {
      String key = (String) o.get(fieldName);
      if (String.isNotBlank(key) && !returnMap.containsKey(key)) {
        returnMap.put(key, new List<SObject>());
      }
      returnMap?.get(key).add(o);
    }
    return returnMap;
  }
  /**
   * @description Extracts Id Set
   * @param  inputList SObject List
   * @return           Id Set
   */
  public static Set<Id> getSetofIds(List<SObject> inputList) {
    return new Set<Id>(getMap(inputList).keySet());
  }
  /**
   * @description Extract Id Set, from key field
   * @param  inputList Sobject List
   * @param  field     key field
   * @return           Id set, values are from key field
   */
  public static Set<Id> getSetofIds(List<SObject> inputList, SObjectField field) {
    return new Set<Id>(getListOfIds(inputList, field));
  }
  /**
   * @description Extract String Set
   * @param  inputList Sobject List
   * @param  field     key field
   * @return           String set, values are from key fields
   */
  public static Set<String> getSetOfStrings(List<SObject> inputList, SObjectField field) {
    return new Set<String>(getListOfStrings(inputList, field));
  }

  private class InnerException extends Exception {
  }
}
