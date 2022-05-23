xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/generacionsolicitud/generarsolicitud/v1";
(:: import schema at "../Schemas/EE_GS_GenerarSolicitud.xsd" ::)
declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;

declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaGenerarSolicitud) ::) {
    <ns1:salidaGenerarSolicitud>
        <ns1:NIR></ns1:NIR>
        <ns1:codigoEstadoSolicitud></ns1:codigoEstadoSolicitud>
        <ns1:descripcionEstadoSolicitud></ns1:descripcionEstadoSolicitud>
        <ns1:mensajeAlSolicitante></ns1:mensajeAlSolicitante>
        <ns1:codigoMensaje>{fn:data($codigoMensaje)}</ns1:codigoMensaje>
        <ns1:descripcionMensaje>{fn:data($descripcionMensaje)}</ns1:descripcionMensaje>
    </ns1:salidaGenerarSolicitud>
};

local:func($codigoMensaje,$descripcionMensaje)