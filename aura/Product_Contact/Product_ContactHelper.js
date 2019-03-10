({
    fetchprodHelper : function(component, event, helper) {
        component.set('v.mycolumns', [
                {label: 'Product Name', fieldName: 'Name', type: 'text'},
                {label: 'Product Family', fieldName: 'Product2Family', type: 'text'},
            {label: 'Unit Price', fieldName: 'UnitPrice', type: 'number',cellAttributes: { alignment: 'left' }}
                ]);
        var action = component.get("c.fetchproducuts");
        action.setParams({"recordId": component.get("v.recordId") });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                 var rows = response.getReturnValue();
                for (var i = 0; i < rows.length; i++) {
                	var row = rows[i];
                	if (row.Product2)
                        row.Product2Family = row.Product2.Family;
            	}
                component.set("v.LstProducts", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})