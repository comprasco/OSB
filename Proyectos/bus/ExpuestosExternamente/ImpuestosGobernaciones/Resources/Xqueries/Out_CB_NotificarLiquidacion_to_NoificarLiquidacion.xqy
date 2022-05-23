xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/impuestosgobernaciones/notificarliquidacion/v1";
(:: import schema at "../Schemas/Legacy/CB_IG_NotificarLiquidacion.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/impuestosgobernaciones/notificarliquidacion/v1";
(:: import schema at "../Schemas/EE_IG_NotificarLiquidacion.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaNotificarLiquidacion) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaNotificarLiquidacion) ::)) as element() (:: schema-element(ns2:salidaNotificarLiquidacion) ::) {
    <ns2:salidaNotificarLiquidacion>
        <codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</codigoMensaje>
        <descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</descripcionMensaje>
    </ns2:salidaNotificarLiquidacion>
};

local:func($payloadResponse)