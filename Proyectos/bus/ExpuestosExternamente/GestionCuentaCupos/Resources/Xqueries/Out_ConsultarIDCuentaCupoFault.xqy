xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/gestioncuentacupos/consultaridcuentacupo/v1";
(:: import schema at "../Schemas/Legacy/CB_GCC_ConsultarIDCuentaCupo.xsd" ::)

declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;
declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaConsultarIDCuentaCupo) ::) {
    <ns1:salidaConsultarIDCuentaCupo>
        <ns1:codigoMensaje>{data($codigoMensaje)}</ns1:codigoMensaje>
        <ns1:descripcionMensaje>{data($descripcionMensaje)}</ns1:descripcionMensaje>
    </ns1:salidaConsultarIDCuentaCupo>
};

local:func($codigoMensaje,$descripcionMensaje)
