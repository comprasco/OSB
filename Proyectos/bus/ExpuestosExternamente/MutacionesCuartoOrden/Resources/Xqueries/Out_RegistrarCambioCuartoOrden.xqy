xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/mutacionesCuartoOrden/registrarCambioCuartoOrden/v1";
(:: import schema at "../Schemas/Legacy/EE_CC_RegistrarCambioCuartoOrden.xsd" ::)
declare variable $codigoMensaje as xs:string external;
declare variable $descripcionMensaje as xs:string external;

declare function local:func($codigoMensaje as xs:string, $descripcionMensaje as xs:string) as element() (:: schema-element(ns1:salidaRegistrarCambioCuartoOrden) ::) {
    <ns1:salidaConsultarCambioCuartoOrden>
    <ns1:codMensaje>{fn:data($codigoMensaje)}</ns1:codMensaje>
    {
            if ($codigoMensaje = '500')
            then <ns1:descripcionMensaje>Excepción no controlada</ns1:descripcionMensaje> 
            else(
             <ns1:descripcionMensaje>{fn:data($descripcionMensaje)}</ns1:descripcionMensaje>)
        }
      
     </ns1:salidaConsultarCambioCuartoOrden>
};

local:func($codigoMensaje,$descripcionMensaje)