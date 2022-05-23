xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/controldigitalizacion/notificardigitalizacion/v1";
(:: import schema at "../Schemas/Legacy/CB_CD_NotificarDigitalizacion.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/controldigitalizacion/notificardigitalizacion/v1";
(:: import schema at "../Schemas/EE_CD_NotificarDigitalizacion.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaNotificarDigitalizacion) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaNotificarDigitalizacion) ::)) as element() (:: schema-element(ns2:salidaNotificarDigitalizacion) ::) {
    <ns2:salidaNotificarDigitalizacion>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
    </ns2:salidaNotificarDigitalizacion>
};

local:func($payloadResponse)