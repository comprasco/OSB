xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_EJF_consultarEstadoJuridico.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/anotaciones/consultarAnotaciones/v1";
(:: import schema at "../Schemas/Legacy/CB_A_consultarAnotaciones.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:salidaDatosAnotacion) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:salidaDatosAnotacion) ::)) as element() (:: schema-element(ns2:consultaEstadoJuridicoRespuesta) ::) {
    <ns2:consultaEstadoJuridicoRespuesta>
        <ns2:codMensaje>{fn:data($payloadRequest/ns1:anotaciones/ns1:codMensaje)}</ns2:codMensaje>
        <ns2:descripcionMensaje>{fn:data($payloadRequest/ns1:anotaciones/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
    </ns2:consultaEstadoJuridicoRespuesta>
};

local:func($payloadRequest)
