xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/certificadotradicion/consultarct/v1";
(:: import schema at "../Schemas/EE_CT_consultarCT.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarDireccionesAnteriores/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarDireccionesAnteriores.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaDireccionesAnteriores) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaDireccionesAnteriores) ::)) as element() (:: schema-element(ns2:salidaConsultaCT) ::) {
    <ns2:salidaConsultaCT>
        <ns2:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</ns2:codMensaje>
        <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
    </ns2:salidaConsultaCT>
};

local:func($payloadResponse)
