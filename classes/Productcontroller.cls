/*
    Component Type : Apex Controller
    Description : This controller can be used in "Product_Contact.Cmp" to display the contact related products.
    Date : 09-03-2019,
    Author:Haridinesh.K
*/
public class Productcontroller {
  /*
   *   Method		: fetchproducuts
   *   Parametes	: RecordID (of Case)
   *   Description	: Query the Producs associated to the contact of the Case.
   * */
  @AuraEnabled
    public static List <PricebookEntry> fetchproducuts(string recordId) {
        Case objCase = new Case();
        string strcountry;
        string strProduct;
        if(recordId != null){
        	objCase = [select id, contactid,contact.name, contact.Product__r.Name,contact.Home_Country__r.Name from case where id=:recordId];    
        	strcountry = objCase.contact.Home_Country__r.Name ;
            strProduct = objCase.contact.Product__r.Name ;
        }
        if(strcountry != null && strProduct != null ){
        	//Query the pricebookEntry for the respective products of the Contact.
            List<PricebookEntry> lstPBE = [SELECT id,Name,UnitPrice ,Pricebook2.Name,Product2.Name,Product2.Family from PricebookEntry where Product2.Name = :strProduct  and Pricebook2.Name = :strcountry  LIMIT 15];
            return lstPBE;
        }
        else{
            return null;
            
        }
            
    }
}