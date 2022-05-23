xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ci/operacionesfinancieras/registrarrecibocaja/v2";
(:: import schema at "../Schemas/CI_OF_RegistrarReciboCaja.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/np/operacionesfinancieras/registrarrecibocaja/v2";
(:: import schema at "../Schemas/Legacy/NP_OF_RegistrarReciboCaja.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaRegistrarReciboCaja) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaRegistrarReciboCaja) ::)) as element() (:: schema-element(ns2:salidaRegistrarReciboCaja) ::) {
    <ns2:salidaRegistrarReciboCaja>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
        
    </ns2:salidaRegistrarReciboCaja>
};

local:func($payloadResponse)