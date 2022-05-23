xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://ws.ani.rnec.gov.co/";
(:: import schema at "../Schemas/Legacy/WSConsultas.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ce/consulta_ANI_RNEC/consultarCedulas/v1";
(:: import schema at "../Schemas/CE_CAR_ConsultarCedulas.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:consultarCedulasResponse) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:consultarCedulasResponse) ::)) as element() (:: schema-element(ns2:salidaConsultarCedulas) ::) {
    <ns2:salidaConsultarCedulas>
    
        
        {
        if (fn:data($payloadResponse/return/estadoConsulta/codError = '0') )  then
        <ns2:codigo>{'200'}</ns2:codigo>
        else <ns2:codigo>{'409'}</ns2:codigo>
        }
        
        {
        if (fn:data($payloadResponse/return/estadoConsulta/codError = '0') )  then
        <ns2:mensaje>{'OK'}</ns2:mensaje>
        else <ns2:mensaje>{fn:data($payloadResponse/return/estadoConsulta/descripcionError)}</ns2:mensaje>
        }
        
        <ns2:infoCedula>
            <ns2:nuip>{fn:data($payloadResponse/return/datosCedulas/datos/nuip)}</ns2:nuip>
            <ns2:primerApellido>{fn:data($payloadResponse/return/datosCedulas/datos/primerApellido)}</ns2:primerApellido>
            <ns2:segundoApellido>{fn:data($payloadResponse/return/datosCedulas/datos/segundoApellido)}</ns2:segundoApellido>
            <ns2:primerNombre>{fn:data($payloadResponse/return/datosCedulas/datos/primerNombre)}</ns2:primerNombre>
            <ns2:segundoNombre>{fn:data($payloadResponse/return/datosCedulas/datos/segundoNombre)}</ns2:segundoNombre>
            <ns2:estadoCedula>{fn:data($payloadResponse/return/datosCedulas/datos/estadoCedula)}</ns2:estadoCedula>
        </ns2:infoCedula>
    </ns2:salidaConsultarCedulas>
};

local:func($payloadResponse)
