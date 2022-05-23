xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_EJF_consultarEstadoJuridico.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/anotaciones/consultarAnotaciones/v1";
(:: import schema at "../Schemas/Legacy/CB_A_consultarAnotaciones.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:consultaEstadoJuridicaSolicitud) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:consultaEstadoJuridicaSolicitud) ::)) as element() (:: schema-element(ns2:entradaDatosAnotacion) ::) {
    <ns2:entradaDatosAnotacion>
        <ns2:convenio>{fn:data($payloadRequest/ns1:convenio)}</ns2:convenio>
        <ns2:tipoIdentificacionPredio>{fn:data($payloadRequest/ns1:tipoIdentificacionPredio)}</ns2:tipoIdentificacionPredio>
        <ns2:numIdentificacionPredio>{fn:data($payloadRequest/ns1:numIdentificacionPredio)}</ns2:numIdentificacionPredio>
        <ns2:claseAnotacion>{'normal'}</ns2:claseAnotacion>
    </ns2:entradaDatosAnotacion>
};

local:func($payloadRequest)
