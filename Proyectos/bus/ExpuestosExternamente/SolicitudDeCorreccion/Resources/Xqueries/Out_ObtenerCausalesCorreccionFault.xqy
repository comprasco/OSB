xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/solicituddecorreccion/obtenercausalescorreccion/v1";
(:: import schema at "../Schemas/Legacy/EE_OCC_ObtenerCausalesCorreccion.xsd" ::)
declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;

declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaObtenerCausalesCorreccion) ::) {
    <ns1:salidaObtenerCausalesCorreccion>
        <ns1:codigo>{fn:data($codigoMensaje)}</ns1:codigo>
        <ns1:mensaje>{fn:data($descripcionMensaje)}</ns1:mensaje>
    </ns1:salidaObtenerCausalesCorreccion>
};

local:func($codigoMensaje,$descripcionMensaje)
