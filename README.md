# N26Task
This Repo contains all the task given to N26


Task 1: Send SUrvery Notification on Scheduled date
Configuration: Enable Translation workbench and enable EN and DE languages
Create lables and create translations of those lables in DE and EN languages

Components:
Workflow:Contact Survey N26
Email Template:
Create 3 Feids on Contact o object:
language
Email sent
survey date

VF Contact
Apex Class:
SurveryNotificationN26
SurveryNotificationN26Updatebackend
SurveryNotificationN26_test

Task 2: Display product information associated to the case contact.
Components: 
Aura: Product_Contact.Cmp
Apex: Productcontroller,Productcontroller_test
Object Conact: 
Field Lable  Field API name     Type 	
Home Country Home_Country__c	Lookup(Price Book)
Product      Product__c	        Lookup(Product)

Configuration: 
Create Pricebook record for each country to maintan the prices of that country. (ex:DE,ES,FR etc)
Create Product Family with diffent type of Producs have.Ex:Calendar Month,ATM Fee, etc.
Create product records of Black,Metal,Standard of for each product familty.

Note: As to follow the OOB principals and considering the task given, the above object desing is developed.
