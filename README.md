# Utils

Este proyecto pretende agrupar varias utilidades que pretenden agilizar el desarrollo de diferentes funcionalidades

## Componentes

### CollectionLibrary

Esta biblioteca tiene varias funciones muy útiles para el manejo de colecciones, permite extraer y manipular listas de Objetos (el resultado más común de un query `SOQL`)

#### Métodos públicos

| Nombre           | Argumentos                                                                  | Descripción                                                                                                                                                                                                                                  |
| ---------------- | --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| getListOfIds     | `List<SObject>` inputList                                                   | Recibe una `List<SObject>` y retorna una `List<Id>` con los Ids de Salesforce de los objetos .                                                                                                                                               |
| getListOfIds     | `List<SObject>` inputList<br />`SObjectField` field                         | Recibe una `List<SObject>` y retorna una `List<Id>` con los valores del campo **field** (**field** debe ser un campo tipo `Id` / `Reference`).                                                                                               |
| getListOfStrings | `List<SObject>` inputList<br />`SObjectField` field                         | Recibe una `List<SObject>` y retorna una `List<String>` con los valores del campo **field** (**field** debe ser un campo tipo `String`).                                                                                                     |
| getMap           | `List<SObject>` inputList                                                   | Recibe una `List<SObject>` y retorna un `Map<Id, SObject>` donde la llave es el Id de Salesforce de cada objeto.                                                                                                                             |
| getMap           | `List<SObject>` inputList<br />`SObjectField` field                         | Recibe una `List<SObject>` y retorna un `Map<Id, SObject>` donde la llave es el campo **field** (**field** debe ser un campo tipo `Id` / `Reference`).                                                                                       |
| getMapByString   | `List<SObject>` inputList<br />`SObjectField` field                         | Recibe una `List<SObject>` y retorna un `Map<String, SObject>` donde la llave es el campo **field** (**field** debe ser un campo tipo `String`).                                                                                             |
| getMapOfIds      | `List<SObject>` inputList<br />`SObjectField` key<br />`SObjectField` value | Recibe una `List<SObject>` y retorna un `Map<Id, Id>` donde la llave es el campo **key** y el valor es el campo **value** (**key** y **value** deben ser campos tipo `Id` / `Reference`)                                                     |
| getMapOfLists    | `List<SObject>` inputList<br />`SObjectField` field                         | Recibe una `List<SObject>` y retorna un `Map<String, List<<SObject>>` donde la llave es el campo **field** y cada `List<SObject>` tiene los objetos que tienen un valor específico de **field** (**field** debe ser un campo tipo `String`). |
| getSetofIds      | `List<SObject>` inputList                                                   | Recibe una `List<SObject>` y retorna un `Set<Id>` con los Ids de Salesforce de los objetos.                                                                                                                                                  |
| getSetofIds      | `List<SObject>` inputList<br />`SObjectField` field                         | Recibe una `List<SObject>` y retorna un `Set<Id>` con los valores del campo **field** (**field** debe ser un campo tipo `Id` / `Reference`).                                                                                                 |
| getSetOfStrings  | `List<SObject>` inputList<br />`SObjectField` field                         | Recibe una `List<SObject>` y retorna un `Set<String>` y retorna una `List<String>` con los valores del campo **field** (**field** debe ser un campo tipo `String`).                                                                          |

### Ejemplo

```apex
Map<String, List<SObject>> mapCases = CollectionLibrary.getMapOfLists([
    SELECT CaseNumber, AccountId
    FROM Case
    WHERE OwnerId IN : CollectionLibrary.getSetofIds([
        SELECT Name, OwnerId FROM Contact],
        Contact.OwnerId)],
    Case.AccountId
);
```
`mapCase` es un mapa en el cual la llave es el id de la cuenta y la lista tiene todos los casos que pertenecen al propietario que se ha filtrado en la consulta de contactos

## Instalación

### Sandbox / Dev

Puedes hacer click en el siguiente botón:

<a href="https://githubsfdeploy.herokuapp.com?owner=jgrimaldos-everis&repo=utils&ref=v1.0">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

Si deseas realizarlo de manera manual puedes seguir los siguientes pasos:

1. Clonar el repo en tu máquina:
   ```bash
   git clone https://github.com/trailheadapps/lwc-recipes
   cd lwc-recipes
   ```
2. Autorizar tu ambiente (en caso de ya tenerlo autorizado, utiliza tu `alias` en lugar de `ambiente`):
   ```bash
   sfdx force:auth:web:login -s -a ambiente
   ```
3. Despliega el paquete:
   ```bash
   sfdx force:source:deploy -p force-app -u ambiente
   ```
4. Ingresa a tu ambiente
   ```bash
   sfdx force:org:open -u ambiente
   ```

### Scratch Org

Puedes ejecutar los siguientes comandos (asumiendo correcta configuración de **VS Code**):

```bash
git clone https://github.com/jgrimaldos-everis/utils
cd utils
sfdx force:source:push -u usuario-de-scratchorg
```
