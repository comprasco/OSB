xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ci/consultadatosregistrales/consultardatosregistrales/v1";
(:: import schema at "../Schemas/CI_CDR_ConsultarDatosRegistrales.xsd" ::)

declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;
declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaConsultarDatosRegistrales) ::) {
    <ns1:salidaConsultarDatosRegistrales>
        <ns1:codigoMensaje>{data($codigoMensaje)}</ns1:codigoMensaje>
        <ns1:descripcionMensaje>{data($descripcionMensaje)}</ns1:descripcionMensaje>
    </ns1:salidaConsultarDatosRegistrales>
};

local:func($codigoMensaje,$descripcionMensaje)