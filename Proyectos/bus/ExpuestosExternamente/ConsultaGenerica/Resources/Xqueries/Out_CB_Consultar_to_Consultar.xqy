xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/consultagenerica/consultar/v1";
(:: import schema at "../Schemas/Legacy/CB_CG_Consultar.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/consultagenerica/consultar/v1";
(:: import schema at "../Schemas/EE_CG_Consultar.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultar) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultar) ::)) as element() (:: schema-element(ns2:salidaConsultar) ::) {
    <ns2:salidaConsultar>
        <ns2:respuesta>{fn:data($payloadResponse/ns1:respuesta)}</ns2:respuesta>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
        
    </ns2:salidaConsultar>
};

local:func($payloadResponse)