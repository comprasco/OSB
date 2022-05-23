xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/controldigitalizacion/notificardigitalizacion/v1";
(:: import schema at "../Schemas/Legacy/CB_CD_NotificarDigitalizacion.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ci/controldigitalizacion/notificardigitalizacion/v1";
(:: import schema at "../Schemas/CI_CD_NotificarDigitalizacion.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaNotificarDigitalizacion) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaNotificarDigitalizacion) ::)) as element() (:: schema-element(ns2:entradaNotificarDigitalizacion) ::) {
    <ns2:entradaNotificarDigitalizacion>
        <ns2:sistemaOrigen>{fn:data($payloadRequest/ns1:sistemaOrigen)}</ns2:sistemaOrigen>
        <ns2:identificadorTramite>{fn:data($payloadRequest/ns1:identificadorTramite)}</ns2:identificadorTramite>
        <ns2:estado>{fn:data($payloadRequest/ns1:estado)}</ns2:estado>
       
    </ns2:entradaNotificarDigitalizacion>
};

local:func($payloadRequest)