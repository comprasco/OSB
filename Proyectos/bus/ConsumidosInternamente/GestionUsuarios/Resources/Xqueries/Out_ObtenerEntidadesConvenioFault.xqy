xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/gestionusuarios/obtenerentidadesconvenio/v1";
(:: import schema at "../Schemas/Legacy/CB_GU_ObtenerEntidadesConvenio.xsd" ::)

declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;
declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaObtenerEntidadesConvenio) ::) {
    <ns1:salidaObtenerEntidadesConvenio>
       
        <ns1:codigoMensaje>{fn:data($codigoMensaje)}</ns1:codigoMensaje>
        <ns1:descripcionMensaje>{fn:data($descripcionMensaje)}</ns1:descripcionMensaje>
    </ns1:salidaObtenerEntidadesConvenio>
};

local:func($codigoMensaje,$descripcionMensaje)