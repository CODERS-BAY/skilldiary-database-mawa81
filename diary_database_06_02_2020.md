# Database Diary 06.02.2020 Mario Wagner

## Theoretical part 

We learned some basic theory about databases. 
* ### Codd's 9 rules:
  * *(Integration)* **Integration:** <br/>Data must be stored in a uniform structure without redundancy.<br/><br/>
  * *(Operationen)* **Operations:** <br/>Data must be stored, changed and searched in a database.<br/><br/>
  * *(Katalog)* **Catalog:** <br/>Information that describes the data in a database, is stored in the catalog.<br/><br/>
  * *(Benutzersichten)* **User views:** <br/>For different applications we need a different view of the database.<br/><br/>
  * *(Integritätssicherung)* **Integrity assurance:** <br/>The correctness of the database content must be <br/>guaranteed, so you can specify rules that each database entry must meet.<br/><br/>
  * *(Zugriffskontrolle)* **Access control:** <br/>Only authorized users and programs may have access to the database.<br/><br/>
  * *(Transaktionen)* **Transactions:** <br/>Bundling several instructions into a single transaction, which are <br/> executed as a functional unit - either completely or not at all.<br/><br/>
  * *(Synchronisation)* **Synchronization:** <br/>Transactions executed in parallel must have the same database <br/>status as any serial execution of the transactions.<br/><br/> 
  * *(Datensicherung)* **Data backup:** <br/>After a system error, the database system must be able to establish <br/>the last consistent database status using automatic data <br/>backup and restore mechanisms.<br/><br/>
   
* ### Entity Relationship Model (ERM):
  * **Datatypes:** <br/>
    varchar, int, date,...
  
  * **Entities:** <br/>
    Object, about which information is to be saved

  * **Relationships:** <br/>
    Relationships between the entities
    * binary: 2 entities
    * ternary: 3 entities
    * unary: 1 entity
  
    Relationships also have cardinalities<br/>
    1:1, 1:N, N:1, M:N

  * **Attributes:** <br/>
    Properties of the entities or relationships
    (Attributes needs datatypes!)

  * **Keys:** <br/>
    Key is used for an unique identification of the entity

* ### Chen Notation:
  the graphical ERM

* ### Textual Notation:
    E (A1:D1 , ...,Ax:Dx)<br/>
 eg. student(stdt_ID:int ,name:varchar(30))


---
## Practical part

1. Exercise

We made an Entity Relationship Model of the CodersBay and commited and pulled it to the exercise repository.

2. Exercise

We made an Entity Relationship Model of the
Austrian Soccer League and commited and pulled it to the exercise repository.

---