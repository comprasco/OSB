xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ci/operacionesfinancieras/registraranulacion/v2";
(:: import schema at "../Schemas/CI_OF_RegistrarAnulacion.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/np/operacionesfinancieras/registraranulacion/v2";
(:: import schema at "../Schemas/Legacy/NP_OF_RegistrarAnulacion.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaRegistrarAnulacion) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaRegistrarAnulacion) ::)) as element() (:: schema-element(ns2:salidaRegistrarAnulacion) ::) {
    <ns2:salidaRegistrarAnulacion>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
       
    </ns2:salidaRegistrarAnulacion>
};

local:func($payloadResponse)