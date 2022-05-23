xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/mutacionesTercerOrden/consultaCambioTercerOrden/v1";
(:: import schema at "../Schemas/Legacy/CB_CC_ConsultaCambioTercerOrden.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/mutacionesTercerOrden/consultaCambioTercerOrden/v1";
(:: import schema at "../Schemas/EE_CC_ConsultaCambioTercerOrden.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultaCambioTercerOrden) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultaCambioTercerOrden) ::)) as element() (:: schema-element(ns2:salidaConsultaCambioTercerOrden) ::) {
    <ns2:salidaConsultaCambioTercerOrden>
        <ns2:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</ns2:codMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaConsultaCambioTercerOrden>
};

local:func($payloadResponse)