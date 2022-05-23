xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ci/gestionConsecutivosCorrespondencia/generarConsecutivoIE/v1";
(:: import schema at "../Schemas/Legacy/CI_GCC_GenerarConsecutivoIE.xsd" ::)
declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;

declare function local:func($codigo as xs:string, $mensaje as xs:string) as element() (:: schema-element(ns1:salidaGenerarConsecutivoIE) ::) {
    <ns1:salidaGenerarConsecutivoIE>
        <ns1:codigoMensaje>{fn:data($codigo)}</ns1:codigoMensaje>
        <ns1:descripcionMensaje>{fn:data($mensaje)}</ns1:descripcionMensaje>
    </ns1:salidaGenerarConsecutivoIE>
};

local:func($codigo,$mensaje)
