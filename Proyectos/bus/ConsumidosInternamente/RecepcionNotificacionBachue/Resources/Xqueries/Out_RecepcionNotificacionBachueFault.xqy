xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ci/recepcionNotificacionBachue/registrarReintentoServicio/v1";
(:: import schema at "../Schemas/CI_CC_RegistrarReintentoServicio.xsd" ::)
declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;

declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaRegistrarReintentoServicio) ::) {
    <ns1:salidaRegistrarReintentoServicio>
    <ns1:codigoMensaje>{fn:data($codigoMensaje)}</ns1:codigoMensaje>
 {
            if ($codigoMensaje = '500')
            then <ns1:descripcionMensaje>Excepción no controlada</ns1:descripcionMensaje> 
            else(
            <ns1:descripcionMensaje>{fn:data($descripcionMensaje)}</ns1:descripcionMensaje>)
       }
    </ns1:salidaRegistrarReintentoServicio>
};

local:func($codigoMensaje,$descripcionMensaje)