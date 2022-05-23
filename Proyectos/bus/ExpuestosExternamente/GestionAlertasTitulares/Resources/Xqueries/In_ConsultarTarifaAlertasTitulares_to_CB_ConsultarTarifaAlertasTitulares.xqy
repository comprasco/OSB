xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/gestionalertastitulares/consultartarifaalertastitulares/v1";
(:: import schema at "../Schemas/Legacy/CB_GAT_ConsultarTarifaAlertasTitulares.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/gestionalertastitulares/consultartarifaalertastitulares/v1";
(:: import schema at "../Schemas/EE_GAT_ConsultarTarifaAlertasTitulares.xsd" ::)

declare variable $payloadResonse as element() (:: schema-element(ns1:entradaConsultarTarifaAlertasTitulares) ::) external;

declare function local:func($payloadResonse as element() (:: schema-element(ns1:entradaConsultarTarifaAlertasTitulares) ::)) as element() (:: schema-element(ns2:entradaConsultarTarifaAlertasTitulares) ::) {
    <ns2:entradaConsultarTarifaAlertasTitulares>
        <ns2:modulo>{fn:data($payloadResonse/ns1:modulo)}</ns2:modulo>
        {
            if ($payloadResonse/ns1:cantidadAlertasNuevas)
            then <ns2:cantidadAlertasNuevas>{fn:data($payloadResonse/ns1:cantidadAlertasNuevas)}</ns2:cantidadAlertasNuevas>
            else ()
        }
        {
            if ($payloadResonse/ns1:tipoDocumento)
            then <ns2:tipoDocumento>{fn:data($payloadResonse/ns1:tipoDocumento)}</ns2:tipoDocumento>
            else ()
        }
        {
            if ($payloadResonse/ns1:numeroDocumento)
            then <ns2:numeroDocumento>{fn:data($payloadResonse/ns1:numeroDocumento)}</ns2:numeroDocumento>
            else ()
        }
        
    </ns2:entradaConsultarTarifaAlertasTitulares>
};

local:func($payloadResonse)