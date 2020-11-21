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



   */
  private static Boolean isValidIdField(SObjectField field) {
    return validIdFieldTypes.contains(field.getDescribe().getType());
  }
  /**



   */
  private static Boolean isValidStringField(SObjectField field) {
    return validStringFieldTypes.contains(field.getDescribe().getType());
  }
  /**



   */
  public static List<Id> getListOfIds(List<SObject> inputList) {
    return new List<Id>(getSetofIds(inputList));
  }
  /**




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



   */
  public static Map<Id, SObject> getMap(List<SObject> inputList) {
    return inputList.isEmpty() ? new Map<Id, SObject>() : new Map<Id, SObject>(inputList);
  }
  /**




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



   */
  public static Set<Id> getSetofIds(List<SObject> inputList) {
    return new Set<Id>(getMap(inputList).keySet());
  }
  /**




   */
  public static Set<Id> getSetofIds(List<SObject> inputList, SObjectField field) {
    return new Set<Id>(getListOfIds(inputList, field));
  }
  /**




   */
  public static Set<String> getSetOfStrings(List<SObject> inputList, SObjectField field) {
    return new Set<String>(getListOfStrings(inputList, field));
  }

  private class InnerException extends Exception {
  }
}
