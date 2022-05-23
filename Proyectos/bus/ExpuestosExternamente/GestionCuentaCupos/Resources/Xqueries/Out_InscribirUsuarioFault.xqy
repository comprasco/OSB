xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/gestioncuentacupos/inscribirusuario/v1";
(:: import schema at "../Schemas/Legacy/CB_GCC_InscribirUsuario.xsd" ::)

declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;
declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaInscribirUsuario) ::) {
    <ns1:salidaInscribirUsuario>
        <ns1:codigoMensaje>{data($codigoMensaje)}</ns1:codigoMensaje>
        <ns1:descripcionMensaje>{data($descripcionMensaje)}</ns1:descripcionMensaje>
    </ns1:salidaInscribirUsuario>
};

local:func($codigoMensaje,$descripcionMensaje)
