xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ci/notificarTerminacionPQRS/terminacionTramite/v1";
(:: import schema at "../Schemas/Legacy/CI_NTPQRS_TerminacionTramite.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/vic/notificarTerminacionPQRS/terminacionTramite/v1";
(:: import schema at "../Schemas/Legacy/VIC_NTPQRS_TerminacionTramite.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaTerminacionTramite) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaTerminacionTramite) ::)) as element() (:: schema-element(ns2:salidaTerminacionTramite) ::) {
    <ns2:salidaTerminacionTramite>
    
          {
                if ($payloadResponse/ns1:codigo = '1')
                then <ns2:codigo>200</ns2:codigo>
                else (<ns2:codigo>500</ns2:codigo>)
                 
            }
            
            
             {
                if ($payloadResponse/ns1:codigo = '1')
                then <ns2:mensaje>OK</ns2:mensaje>
                else (<ns2:mensaje>Excepción no controlada</ns2:mensaje>)
            }
        
    </ns2:salidaTerminacionTramite>
};

local:func($payloadResponse)
