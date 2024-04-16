public class B2B_LanguageSwitcherController {
    @AuraEnabled(cacheable = true)
    public static String getLanguages(Map<String,Object> dataMap){
        try {
            dataMap = B2B_LanguageSwitcherHelper.getLanguages(dataMap);
        } catch (Exception e) {
            dataMap = dataMap == null ? new Map<String, Object>() : dataMap ;
            dataMap.put(B2B_Constants.IS_SUCCESS, false);
            String errMessage='Line Number-->>'+e.getLineNumber()+''+' -- '+e.getMessage();
            dataMap.put(B2B_Constants.ERROR,e.getMessage());
        } 
        system.debug('dataMap'+dataMap);
        return JSON.serialize(dataMap);
    }
    
    @AuraEnabled
    public static String updateUserLanguage(Map<String,Object> dataMap){
        try {
            B2B_LanguageSwitcherHelper.updateUserLanguage(dataMap);
            dataMap.put(B2B_Constants.IS_SUCCESS, true);
        } catch (Exception e) {
            dataMap = dataMap == null ? new Map<String, Object>() : dataMap ;
            dataMap.put(B2B_Constants.IS_SUCCESS, false);
            String errMessage='Line Number-->>'+e.getLineNumber()+''+' -- '+e.getMessage();
            dataMap.put(B2B_Constants.ERROR,e.getMessage());
        } 
        return JSON.serialize(dataMap);
    }
}