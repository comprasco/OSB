xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/impuestosgobernaciones/notificarliquidacion/v1";
(:: import schema at "../Schemas/EE_IG_NotificarLiquidacion.xsd" ::)

declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;
declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaNotificarLiquidacion) ::) {
    <ns1:salidaNotificarLiquidacion>
        <codigoMensaje>{data($codigoMensaje)}</codigoMensaje>
        <descripcionMensaje>{data($descripcionMensaje)}</descripcionMensaje>
    </ns1:salidaNotificarLiquidacion>
};

local:func($codigoMensaje,$descripcionMensaje)