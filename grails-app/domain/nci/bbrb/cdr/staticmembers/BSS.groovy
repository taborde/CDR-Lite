package nci.bbrb.cdr.staticmembers

/*
 * BSS = Biospecimen Source Site
 *
 */
class BSS extends StaticMemberBaseClass{

    BSS parentBss
    Study study
    String IRBprotocol
    String shippingAddress
    //Date dateIRBApproved
    //Date dateIRBExpires
    String timeZone // selected from enum TimeZones
    String toString(){"$code"}

    static constraints = {
        parentBss(blank:true,nullable:true)
        study(blank:false,nullable:false)
        IRBprotocol(blank:true,nullable:true)
        shippingAddress(blank:true,nullable:true,widget:'textarea')
        timeZone(blank:true,nullable:true)
       // dateIRBApproved(blank:true, nullable:true)
       // dateIRBExpires(blank:true, nullable:true)
    }
    
    static searchable ={
        only= ['name', 'code']
        'name' name:'BSSName'
        'code' name:'BSSCode'
        root false
    }
     
    //pmh: CDRQA:1114 
    enum TimeZones {
        
        HAWAII("Hawaii Time"),
        ALASKA("Alaska Time"),
        PACIFIC("Pacific Time"),
        MOUNTAIN("Mountain Time"),
        CENTRAL("Central Time"),
        EASTERN("Eastern Time")

        final String value;

        TimeZones(String value) {
            this.value = value;
        }

        String toString() {
            value;
        }

        String getKey() {
            name()
        }

        static list() {
            [HAWAII,ALASKA,PACIFIC,MOUNTAIN,CENTRAL,EASTERN]
        }
    }
      static mapping = {
      table 'st_bss'
      id generator:'identity', params:[sequence:'st_bss_pk']
    }
}
