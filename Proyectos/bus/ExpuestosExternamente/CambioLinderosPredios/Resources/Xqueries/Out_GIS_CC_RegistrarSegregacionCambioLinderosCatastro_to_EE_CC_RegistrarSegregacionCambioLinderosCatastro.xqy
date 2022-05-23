xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/cambioLinderosPredios/registrarSegregacionCambioLinderosCatastro/v1";
(:: import schema at "../Schemas/EE_CC_RegistrarSegregacionCambioLinderosCatastro.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/gis/cambioLinderosPredios/registrarSegregacionCambioLinderosCatastro/v1";
(:: import schema at "../Schemas/Legacy/GIS_CC_RegistrarSegregacionCambioLinderosCatastro.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaRegistrarSegregacionCambioLinderosCatastro) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaRegistrarSegregacionCambioLinderosCatastro) ::)) as element() (:: schema-element(ns2:salidaRegistrarSegregacionCambioLinderosCatastro) ::) {
    
    
    <ns2:salidaRegistrarSegregacionCambioLinderosCatastro>
    
   <ns2:codMensaje>{fn:data($payloadResponse/ns1:results[ns1:paramName='ERROR']/ns1:value)}</ns2:codMensaje>
   <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:results[ns1:paramName='MENSAJE']/ns1:value)}</ns2:descripcionMensaje>
    </ns2:salidaRegistrarSegregacionCambioLinderosCatastro>
    
};

local:func($payloadResponse)