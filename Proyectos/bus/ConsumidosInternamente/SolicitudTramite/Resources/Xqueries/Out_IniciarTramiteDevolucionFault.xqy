xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ci/solicitudTramite/iniciarTramiteDevolucion/v1";
(:: import schema at "../Schemas/Legacy/CI_ST_IniciarTramiteDevolucion.xsd" ::)
declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;

declare function local:func($codigo as xs:string, $mensaje as xs:string) as element() (:: schema-element(ns1:salidaIniciarTramiteDevolucion) ::) {
    <ns1:salidaIniciarTramiteDevolucion>
        <ns1:codigoMensaje>{fn:data($codigo)}</ns1:codigoMensaje>
        <ns1:descripcionMensaje>{fn:data($mensaje)}</ns1:descripcionMensaje>
    </ns1:salidaIniciarTramiteDevolucion>
};

local:func($codigo,$mensaje)
