xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/impuestosgobernaciones/notificarpago/v1";
(:: import schema at "../Schemas/EE_IG_NotificarPago.xsd" ::)

declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;
declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaNotificarPago) ::) {
    <ns1:salidaNotificarPago>
        <codigoMensaje>{data($codigoMensaje)}</codigoMensaje>
        <descripcionMensaje>{data($descripcionMensaje)}</descripcionMensaje>
    </ns1:salidaNotificarPago>
};

local:func($codigoMensaje,$descripcionMensaje)