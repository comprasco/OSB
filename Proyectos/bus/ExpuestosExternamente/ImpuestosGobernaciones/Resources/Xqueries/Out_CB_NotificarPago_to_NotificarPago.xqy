xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/impuestosgobernaciones/notificarpago/v1";
(:: import schema at "../Schemas/Legacy/CB_IG_NotificarPago.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/impuestosgobernaciones/notificarpago/v1";
(:: import schema at "../Schemas/EE_IG_NotificarPago.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaNotificarPago) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaNotificarPago) ::)) as element() (:: schema-element(ns2:salidaNotificarPago) ::) {
    <ns2:salidaNotificarPago>
        <codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</codigoMensaje>
        <descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</descripcionMensaje>
    </ns2:salidaNotificarPago>
};

local:func($payloadResponse)