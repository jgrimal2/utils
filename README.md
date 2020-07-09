# Utils

Este proyecto pretende agrupar varias utilidades que pretenden agilizar el desarrollo de diferentes funcionalidades

## Componentes

### CollectionLibrary

Esta biblioteca tiene varias funciones muy útiles para el manejo de colecciones, permite extraer y manipular listas de Objetos (el resultado más común de un query `SOQL`)

#### Métodos públicos

|Nombre|Argumentos|Descripción|
|-|-|-|
|getListOfIds|`List<SObject>` inputList|Recibe una `List<SObject>` y retorna una `List<Id>` con los Ids de Salesforce de los objetos .
|getListOfIds|`List<SObject>` inputList<br />`SObjectField` field|Recibe una `List<SObject>` y retorna una `List<Id>` con los valores del campo **field** (**field** debe ser un campo tipo `Id` / `Reference`).
|getListOfStrings|`List<SObject>` inputList<br />`SObjectField` field|Recibe una `List<SObject>` y retorna una `List<String>` con los valores del campo **field** (**field** debe ser un campo tipo `String`).
|getMap|`List<SObject>` inputList|Recibe una `List<SObject>` y retorna un `Map<Id, SObject>` donde la llave es el Id de Salesforce de cada objeto.
|getMap|`List<SObject>` inputList<br />`SObjectField` field|Recibe una `List<SObject>` y retorna un `Map<Id, SObject>` donde la llave es el campo **field** (**field** debe ser un campo tipo `Id` / `Reference`).
|getMapByString|`List<SObject>` inputList<br />`SObjectField` field|Recibe una `List<SObject>` y retorna un `Map<String, SObject>` donde la llave es el campo **field** (**field** debe ser un campo tipo `String`). 
|getMapOfIds|`List<SObject>` inputList<br />`SObjectField` key<br />`SObjectField` value|Recibe una `List<SObject>` y retorna un `Map<Id, Id>` donde la llave es el campo **key** y el valor es el campo **value** (**key** y **value** deben ser campos tipo `Id` / `Reference`)
|getMapOfLists|`List<SObject>` inputList<br />`SObjectField` field|Recibe una `List<SObject>` y retorna un `Map<String, List<<SObject>>` donde la llave es el campo **field** y cada `List<SObject>` tiene los objetos que tienen un valor específico de **field** (**field** debe ser un campo tipo `String`).
|getSetofIds|`List<SObject>` inputList|Recibe una `List<SObject>` y retorna un `Set<Id>` con los Ids de Salesforce de los objetos.
|getSetofIds|`List<SObject>` inputList<br />`SObjectField` field|Recibe una `List<SObject>` y retorna un `Set<Id>` con los valores del campo **field** (**field** debe ser un campo tipo `Id` / `Reference`). 
|getSetOfStrings|`List<SObject>` inputList<br />`SObjectField` field|Recibe una `List<SObject>` y retorna un `Set<String>` y retorna una `List<String>` con los valores del campo **field** (**field** debe ser un campo tipo `String`).
 
## Ejemplos

`TO-DO`

## Instalación

`TO-DO`