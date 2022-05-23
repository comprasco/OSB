xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/certificadotradicion/consultarct/v1";
(:: import schema at "../Schemas/EE_CT_consultarCT.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarPropietarios/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarPropietarios.xsd" ::)

declare variable $payloadResponseFault as element() (:: schema-element(ns1:salidaDatosPropietario) ::) external;

declare function local:func($payloadResponseFault as element() (:: schema-element(ns1:salidaDatosPropietario) ::)) as element() (:: schema-element(ns2:salidaConsultaCT) ::) {
    <ns2:salidaConsultaCT>
        <ns2:codMensaje>{fn:data($payloadResponseFault/ns1:codMensaje)}</ns2:codMensaje>
        <ns2:descripcionMensaje>{fn:data($payloadResponseFault/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
    </ns2:salidaConsultaCT>
};

local:func($payloadResponseFault)
