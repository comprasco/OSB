xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ci/operacionesfinancieras/registrarliquidacion/v2";
(:: import schema at "../Schemas/CI_OF_RegistrarLiquidacion.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/np/operacionesfinancieras/registrarliquidacion/v2";
(:: import schema at "../Schemas/Legacy/NP_OF_RegistrarLiquidacion.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaRegistrarLiquidacion) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaRegistrarLiquidacion) ::)) as element() (:: schema-element(ns2:salidaRegistrarLiquidacion) ::) {
    <ns2:salidaRegistrarLiquidacion>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
        
    </ns2:salidaRegistrarLiquidacion>
};

local:func($payloadResponse)