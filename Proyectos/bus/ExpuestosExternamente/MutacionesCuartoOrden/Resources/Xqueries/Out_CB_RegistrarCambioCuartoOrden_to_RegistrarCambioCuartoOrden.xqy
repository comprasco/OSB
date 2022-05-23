xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/mutacionesCuartoOrden/registrarCambioCuartoOrden/v1";
(:: import schema at "../Schemas/Legacy/EE_CC_RegistrarCambioCuartoOrden.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaRegistrarCambioCuartoOrden) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaRegistrarCambioCuartoOrden) ::)) as element() (:: schema-element(ns1:salidaRegistrarCambioCuartoOrden) ::) {
    <ns1:salidaRegistrarCambioCuartoOrden>
        <ns1:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</ns1:codMensaje>
        {
            if ($payloadResponse/ns1:codMensaje='200')
            then <ns1:descripcionMensaje>{'OK'}</ns1:descripcionMensaje>
            else (
            <ns1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns1:descripcionMensaje>
            )
        }
    </ns1:salidaRegistrarCambioCuartoOrden>
};

local:func($payloadResponse)
