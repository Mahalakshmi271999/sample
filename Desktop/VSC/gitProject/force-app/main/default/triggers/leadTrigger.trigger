trigger leadTrigger on Lead (before insert,before update) {
    
    Set<String> countrynameslead=new Set<String>();
    for(Lead l : Trigger.New){
        countrynameslead.add(l.Country);
    }
    List<Country__mdt> mdtlist = [Select Id,MasterLabel,Continent__c From Country__mdt
                                  where MasterLabel IN :countrynameslead];
    Set<String> countrymdt = new Set<String>();
    Set<String> contimdt = new Set<String>();
    for(Country__mdt m : mdtlist){
        countrymdt.add(m.MasterLabel);
        contimdt.add(m.Continent__c);
    }
    
    Map<String,String> mapcc = new Map<String,String>();
    for(Country__mdt mdtobj : mdtlist ){
        mapcc.put(mdtobj.MasterLabel,mdtobj.Continent__c);
    }
    
    List<Continent__c> cuser = [Select Id,Name,OwnerId From Continent__c where Name IN :contimdt];

    
    Map<String,String> mapco = new Map<String,String>();
    for(Continent__c conobj : cuser){
        mapco.put(conobj.Name,conobj.OwnerId);
    }
     
     
    for(Lead lobj : Trigger.New){
        if(!(countrymdt.contains(lobj.Country))){
            lobj.addError('Please enter correct country');
        }
          
        else{ 
            //lobj.continent = mapcc.get(lobj.Country);
            lobj.OwnerId = mapco.get(mapcc.get(lobj.Country));
        }
    }
    
}