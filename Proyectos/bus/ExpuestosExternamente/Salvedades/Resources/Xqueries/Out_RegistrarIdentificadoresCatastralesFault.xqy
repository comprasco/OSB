xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/salvedades/registrarIdentificadoresCatastrales/v1";
(:: import schema at "../Schemas/Legacy/EE_CC_RegistrarIdentificadoresCatastrales.xsd" ::)
declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;

declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaRegistrarIdentificadoresCatastrales) ::) {
    <ns1:salidaRegistrarIdentificadoresCatastrales>
        <ns1:codMensaje>{fn:data($codigoMensaje)}</ns1:codMensaje>
        {
            if ($codigoMensaje = '500')
            then <ns1:descripcionMensaje>Excepción no controlada</ns1:descripcionMensaje> 
            else(
            <ns1:descripcionMensaje>{fn:data($descripcionMensaje)}</ns1:descripcionMensaje>)
        }
    </ns1:salidaRegistrarIdentificadoresCatastrales>
};

local:func($codigoMensaje,$descripcionMensaje)