public class CasevaultAPI {

    public class CasevaultAddSpecificConfigReq {

        public Integer configID;    //1
        public String configName;   //PmntPeriod
        public String activeSwitch; //Y
        public String configDesc;   //Job runs for defined month pay period PriorMonth | CurrentMonth
        public String configValue;  //PriorMonth
        public List<CasevaultConfigDetailWrapper> details;
    }
    
    public class CasevaultGetConfigAllRes {

        public String status;   //success
        public CasevaultConfigSuccessWrapper[] data;
        public CasevaultErrorRes error;
    }

    public class CasevaultGetSpecificConfigRes {

        public String status;   //success
        public CasevaultConfigSuccessWrapper data;
        public CasevaultErrorRes error;
    }

    public class CasevaultConfigSuccessWrapper {

        @AuraEnabled
        public Integer configID;//1
        @AuraEnabled
        public String configName;   //PmntPeriod
        @AuraEnabled
        public String activeSwitch; //Y
        @AuraEnabled
        public String configDesc;   //Job runs for defined month pay period PriorMonth | CurrentMonth
        @AuraEnabled
        public String configValue;  //PriorMonth
        public List<CasevaultConfigDetailWrapper> details;
    }

    public class CasevaultConfigWrapper {

        public Integer configID;    //1
        public String configName;   //PmntPeriod
        public String activeSwitch; //Y
        public String configDesc;   //Job runs for defined month pay period PriorMonth | CurrentMonth
        public String configValue;  //PriorMonth
    }

    public class CasevaultConfigDetailWrapper {

        public String activeSwitch; //Y
        public String configDetailDesc; //Job runs for defined month pay period PriorMonth | CurrentMonth
        public Integer configDetailID;  //1
        public String configDetailName; //PmntPeriod
        public String configDetailValue;    //PriorMonth
    }

    public class CasevaultErrorRes {

        public String code;
        public String message; 
    }
}